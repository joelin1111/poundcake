<?php
class XmlFinder
{
    protected $xml;
    public function __construct($xml)
    {
        $this->xml = new SimpleXMLElement($xml);
    }
    public function findProcessById($id)
    {
        $attr = false;
        $el = $this->xml->xpath("//process[@id='$id']");
        if($el && count($el) === 1) {
            $attr = (array) $el[0]->attributes();
            $attr = $attr['@attributes'];
        }
        return $attr;
    }
    // ... other methods ...
}
?>
