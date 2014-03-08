
" XML Attribute
function XmlAttribCallback (xml_tag)
  if a:xml_tag ==? "customUI"
    return 'xmlns="http://schemas.microsoft.com/office/2006/01/customui"'
  endif
  return 0
endfunction
