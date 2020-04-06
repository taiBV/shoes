CKEDITOR.editorConfig = function( config ) {
    // Define changes to default configuration here. For example:
    // config.language = 'fr';
    // config.uiColor = '#AADC6E';
   //  config.extraPlugins = 'cloudservices';
        config.removePlugins = 'easyimage, cloudservices';
 
        config.filebrowserBrowseUrl = '/ckfinder/ckfinder.html';
 
        config.filebrowserImageBrowseUrl = '/ckfinder/ckfinder.html?type=Images';
 
        config.filebrowserFlashBrowseUrl = '/ckfinder/ckfinder.html?type=Flash';
 
        config.filebrowserUploadUrl = '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
 
        config.filebrowserImageUploadUrl = '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';
 
        config.filebrowserFlashUploadUrl = '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';
         
         
};
