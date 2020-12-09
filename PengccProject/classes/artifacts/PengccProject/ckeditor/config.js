/**
 * @license Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
		// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	// 编辑器样式，有三种：'kama'（默认）、'office2003'、'v2'
    //config.skin = 'office2003';
     // 设置宽高 
  config.width = 600;
  config.height = 400;
  // 背景颜色
  config.uiColor = '#AADC6E';
  config.filebrowserBrowseUrl = '../ckfinder/ckfinder.html',
  config.filebrowserImageBrowseUrl = '../ckfinder/ckfinder.html?type=Images',
  config.filebrowserFlashBrowseUrl = '../ckfinder/ckfinder.html?type=Flash',
  config.filebrowserUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
  config.filebrowserImageUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
  config.filebrowserFlashUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash',
  config.filebrowserWindowWidth = '1500',
  config.filebrowserWindowHeight = '1500'
};
