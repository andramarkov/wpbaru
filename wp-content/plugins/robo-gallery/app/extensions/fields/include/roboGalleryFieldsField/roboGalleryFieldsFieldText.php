<?php
/* 
*      Robo Gallery     
*      Version: 3.2.12 - 28800
*      By Robosoft
*
*      Contact: https://robogallery.co/ 
*      Created: 2021
*      Licensed under the GPLv2 license - http://opensource.org/licenses/gpl-2.0.php

 */


class roboGalleryFieldsFieldText extends roboGalleryFieldsField{
	
	protected function getDefaultOptions(){
		return array(
			'textBefore' => '',
			'textAfter' => '',
		);
	}
}
