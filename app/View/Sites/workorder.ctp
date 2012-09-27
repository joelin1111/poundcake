<?php
/**
 * Include the required Class file
 */
//include('ExcelWriterXML.php');
App::import('Vendor','ExcelWriterXML/ExcelWriterXML');


/**
 * Create a new instance of the Excel Writer
 */

$filename = 'Work Order '.$site['Site']['site_code'].' '.$site['Site']['site_name'].'.xml';

$xml = new ExcelWriterXML( $filename );

/**
 * Add some general properties to the document
 */
$xml->docTitle('Inveneo Work Order');
$xml->docAuthor('Tower DB');
$xml->docCompany('Inveneo');
$xml->docManager('');

/**
 * Choose to show any formatting/input errors on a seperate sheet
 */
$xml->showErrorSheet(true);

/**
 * Show the style options
 */
$fmt1 = $xml->addStyle('format1-header');
$fmt1->alignHorizontal('Left');
$fmt1->fontSize('24');

$fmt2 = $xml->addStyle('format2');
$fmt2->alignHorizontal('Left');
$fmt2->fontSize('12');
$fmt2->fontBold();

$fmt3 = $xml->addStyle('format3');
$fmt3->alignHorizontal('Right');
$fmt3->fontSize('12');
$fmt3->fontBold();

$fmt4 = $xml->addStyle('value');
$fmt4->alignHorizontal('Left');
$fmt4->fontSize('12');
$fmt4->alignWraptext();

// Excel color picker:
// http://dmcritchie.mvps.org/excel/colors.htm#colorindex
$fmtBanner = $xml->addStyle('banner');
$fmtBanner->bgColor('#BEBEBE');
$fmtBanner->alignHorizontal('Right');
$fmtBanner->fontBold();
$fmtBanner->fontSize('12');

// Create a new sheet with the XML document
$sheet1 = $xml->addSheet('Alignment');

$row = 1;
$sheet1->writeString($row,1,'Inveneo Site Install Work Order',$fmt1);
$sheet1->columnWidth(1,'150'); // Column A
$sheet1->columnWidth(2,'200'); // Column B
$sheet1->columnWidth(3,'20'); // Column C
$sheet1->columnWidth(4,'150'); // Column D
$sheet1->columnWidth(5,'200'); // Column E

$today = date("D M j G:i:s T Y");
$sheet1->writeString($row,5,'Work Order generated: '.$today,$fmt3);

$row += 2;
// col 1
$sheet1->writeString($row,1,'Install Team',$fmt3);
$sheet1->writeString($row,2,$site['InstallTeam']['name'],$fmt4);
// col 2
$sheet1->writeString(4,4,'GPS Coordinates',$fmt3);
$coordinates = sprintf("%01.5f",$site['Site']['lat']).' '.sprintf("%01.5f",$site['Site']['lon']);
$sheet1->writeString(4,5,$coordinates,$fmt4);
$row++;

// col 1
$sheet1->writeString($row,1,'Install Date',$fmt3);
$date = new DateTime($site['Site']['install_date']);
$sheet1->writeString($row,2,$date->format('Y-m-d'),$fmt4);
// col 2
$sheet1->writeString($row,4,'Tower Type',$fmt3);
$sheet1->writeString($row,5,$site['TowerType']['name'],$fmt4);
$row++;

// col 1
$sheet1->writeString($row,1,'Site Name (Code)',$fmt3);
$sheet1->writeString($row,2,$site['Site']['site_name'].' ('.$site['Site']['site_name'].')',$fmt4);
// col 2
$sheet1->writeString($row,4,'Tower Member',$fmt3);
$sheet1->writeString($row,5,$site['TowerMember']['name'],$fmt4);
$row++;

// col 1
$sheet1->writeString($row,1,'Tower Owner',$fmt3);
$sheet1->writeString($row,2,$site['TowerOwner']['name'],$fmt4);
// col 2
$sheet1->writeString($row,4,'Install Team',$fmt3);
$sheet1->writeString($row,5,$site['InstallTeam']['name'],$fmt4);
$row++;

// col 1
$sheet1->writeString($row,1,'Technical Contact(s)',$fmt3);
$n = count($towercontacts);
$i = 0;
$c = '';
foreach ($towercontacts as $contact) {
    $c .= $contact['Contact']['name_vf'];
    if ($i < $n-1) {
        $c .= ', ';
    }
    $i++;
}
$sheet1->writeString($row,2,$c,$fmt4);
// col 2
$sheet1->writeString($row,4,'Tower Equipment',$fmt3);
$sheet1->writeString($row,5,$site['TowerEquipment']['name'],$fmt4);
$row++;

// col 1
$sheet1->writeString($row,1,'Tower Mount',$fmt3);
$sheet1->writeString($row,2,$site['TowerMount']['name'],$fmt4);
$row++;

// ****************************************************************************
// Router
// ****************************************************************************
$row++;
$sheet1->writeString($row,1,'Router',$fmtBanner);
$sheet1->writeString($row,2,'',$fmtBanner);
$sheet1->writeString($row,3,'',$fmtBanner);
$sheet1->writeString($row,4,'',$fmtBanner);
$sheet1->writeString($row,5,'',$fmtBanner);
$row++;

$sheet1->writeString($row,2,$site['NetworkRouter']['name'],$fmt4);
$row++;

// ****************************************************************************
// Switch
// ****************************************************************************
$row++;
$sheet1->writeString($row,1,'Switch',$fmtBanner);
$sheet1->writeString($row,2,'',$fmtBanner);
$sheet1->writeString($row,3,'',$fmtBanner);
$sheet1->writeString($row,4,'',$fmtBanner);
$sheet1->writeString($row,5,'',$fmtBanner);
$row++;

$sheet1->writeString($row,1,'Name',$fmt3);
$sheet1->writeString($row,2,$switch['SwitchType']['name'],$fmt4);
$row++;

$sheet1->writeString($row,1,'Ports',$fmt3);
$sheet1->writeString($row,2,$switch['SwitchType']['ports'],$fmt4);
$row++;

// ****************************************************************************
// Radios
// ****************************************************************************
$row++;
$sheet1->writeString($row,1,'Radios',$fmtBanner);
$sheet1->writeString($row,2,'',$fmtBanner);
$sheet1->writeString($row,3,'',$fmtBanner);
$sheet1->writeString($row,4,'',$fmtBanner);
$sheet1->writeString($row,5,'',$fmtBanner);

$row++;
//$n = count($radios);
//$i = 0;
//$c = '';
foreach ($radios as $radio) {
    $sheet1->writeString($row,1,'Name',$fmt3);
    $sheet1->writeString($row,2,$radio['NetworkRadios']['name'],$fmt4);
    $sheet1->writeString($row,4,'Frequency',$fmt3);
    $sheet1->writeString($row,5,$radio['NetworkRadios']['frequency'],$fmt4);
    $row++;
    
    $sheet1->writeString($row,1,'Radio Type',$fmt3);
    $sheet1->writeString($row,2,$radio['RadioType']['name'],$fmt4);
    $sheet1->writeString($row,4,'SSID',$fmt3);
    $sheet1->writeString($row,5,$radio['NetworkRadios']['ssid'],$fmt4);
    $row++;
    
    $sheet1->writeString($row,1,'Antenna Type',$fmt3);
    $sheet1->writeString($row,2,$radio['AntennaType']['name'],$fmt4);
    $sheet1->writeString($row,4,'Switch Port',$fmt3);
    $sheet1->writeString($row,5,$radio['NetworkRadios']['switch_port'],$fmt4);
    $row++;
    
    $sheet1->writeString($row,1,'Link Distance',$fmt3);
    $d = sprintf("%01.2f",$radio['NetworkRadios']['distance']);
    $sheet1->writeString($row,2,$d." Km",$fmt4);
    $sheet1->writeString($row,4,'IP',$fmt3);
    $sheet1->writeString($row,5,'[addrpool or manual?]',$fmt4);
    $row++;
    
    $sheet1->writeString($row,1,'Azimuth (True)',$fmt3);
    $d = sprintf("%01.2f",$radio['NetworkRadios']['true_azimuth']);
    $sheet1->writeString($row,2,$d."°",$fmt4);
    $sheet1->writeString($row,4,'Gateway',$fmt3);
    $sheet1->writeString($row,5,'[addrpool or manual?]',$fmt4);
    $row++;
    
    $mag_azimuth = $radio['NetworkRadios']['true_azimuth'] - $site['Site']['declination'];
    $sheet1->writeString($row,1,'Azimuth (Magnetic)',$fmt3);
    $d = sprintf("%01.2f",$mag_azimuth);
    $sheet1->writeString($row,2,$d."°",$fmt4);
    $sheet1->writeString($row,4,'Elevaton',$fmt3);
    $sheet1->writeString($row,5,$radio['NetworkRadios']['elevation'],$fmt4);
    
    $row += 2;    
}

// $sheet1->writeString($row ,2,$site['NetworkSwitch']['name'],$fmtBanner);
// 
// Send the headers, then output the data
$xml->sendHeaders();
$xml->writeData();


?>