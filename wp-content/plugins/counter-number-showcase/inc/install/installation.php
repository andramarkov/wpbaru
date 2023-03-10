<?php
function wpsm_cns_front_script() {
    
		//font awesome css
		wp_enqueue_style('wpsm_counter-font-awesome-front', wpshopmart_cns_directory_url.'assets/css/font-awesome/css/font-awesome.min.css');
		wp_enqueue_style('wpsm_counter_bootstrap-front', wpshopmart_cns_directory_url.'assets/css/bootstrap-front.css');
		wp_enqueue_style('wpsm_counter_column', wpshopmart_cns_directory_url.'assets/css/counter-column.css');
	
		//JS		
		wp_enqueue_script('jquery');
		wp_enqueue_script( 'wpsm_count_bootstrap-js-front', wpshopmart_cns_directory_url.'assets/js/bootstrap.js', array(), '', true );
		wp_enqueue_script('wpsm-new_count_script3', wpshopmart_cns_directory_url.'assets/js/counter_nscript.js','','',true);
		wp_enqueue_script('wpsm-new_count_waypoints', wpshopmart_cns_directory_url.'assets/js/waypoints.min.js','','',true);
		wp_enqueue_script('wpsm-new_count_script2', wpshopmart_cns_directory_url.'assets/js/jquery.counterup.min.js','','',true);
		
}

add_action( 'wp_enqueue_scripts', 'wpsm_cns_front_script');
add_filter( 'widget_text', 'do_shortcode');

add_action( 'admin_notices', 'wpsm_cns_review' );
function wpsm_cns_review() {

	// Verify that we can do a check for reviews.
	$review = get_option( 'wpsm_cns_review' );
	$time	= time();
	$load	= false;
	if ( ! $review ) {
		$review = array(
			'time' 		=> $time,
			'dismissed' => false
		);
		add_option('wpsm_cns_review', $review);
		//$load = true;
	} else {
		// Check if it has been dismissed or not.
		if ( (isset( $review['dismissed'] ) && ! $review['dismissed']) && (isset( $review['time'] ) && (($review['time'] + (DAY_IN_SECONDS * 2)) <= $time)) ) {
			$load = true;
		}
	}
	// If we cannot load, return early.
	if ( ! $load ) {
		return;
	}

	// We have a candidate! Output a review message.
	?>
	<div class="notice notice-info is-dismissible wpsm-cns-review-notice">
		<div style="float:left;margin-right:10px;margin-bottom:5px;">
			<img style="width:100%;width: 150px;height: auto;" src="<?php echo esc_url(wpshopmart_cns_directory_url.'assets/images/show-icon.png'); ?>" />
		</div>
		<p style="font-size:18px;"><?php esc_html_e('Hi! We saw you have been using ',wpshopmart_cns_text_domain); ?><strong><?php esc_html_e('Counter Number showcase plugin',wpshopmart_cns_text_domain); ?></strong><?php esc_html_e(' for a few days and wanted to ask for your help to ',wpshopmart_cns_text_domain); ?><strong><?php esc_html_e('make the plugin better',wpshopmart_cns_text_domain); ?></strong><?php esc_html_e('. We just need a minute of your time to rate the plugin. Thank you!',wpshopmart_cns_text_domain); ?></p>
		<p style="font-size:18px;"><strong><?php _e( '~ wpshopmart', '' ); ?></strong></p>
		<p style="font-size:19px;"> 
			<a style="color: #fff;background: #ef4238;padding: 5px 7px 4px 6px;border-radius: 4px;" href="https://wordpress.org/support/plugin/counter-number-showcase/reviews/?filter=5#new-post" class="wpsm-cns-dismiss-review-notice wpsm-cns-review-out" target="_blank" rel="noopener"><?php esc_html_e('Rate the plugin',wpshopmart_cns_text_domain); ?></a>&nbsp; &nbsp;
			<a style="color: #fff;background: #27d63c;padding: 5px 7px 4px 6px;border-radius: 4px;" href="#"  class="wpsm-cns-dismiss-review-notice wpsm-rate-later" target="_self" rel="noopener"><?php _e( 'Nope, maybe later', '' ); ?></a>&nbsp; &nbsp;
			<a style="color: #fff;background: #31a3dd;padding: 5px 7px 4px 6px;border-radius: 4px;" href="#" class="wpsm-cns-dismiss-review-notice wpsm-rated" target="_self" rel="noopener"><?php _e( 'I already did', '' ); ?></a>
		<a style="    color: #fff;
    background: #5c60d0;
    padding: 5px 7px 4px 6px;
    border-radius: 4px;
    margin-left: 10px;
    text-decoration: none;" href="https://wpshopmart.com/plugins/counter-numbers-pro/" class="btn btn-primary" target="_blank" rel="noopener"><?php _e( 'Upgrade To Counter Number Pro Plugin', '' ); ?></a>
		</p>
	</div>
	<script type="text/javascript">
		jQuery(document).ready( function($) {
			$(document).on('click', '.wpsm-cns-dismiss-review-notice, .wpsm-cns-dismiss-notice .notice-dismiss', function( event ) {
				if ( $(this).hasClass('wpsm-cns-review-out') ) {
					var wpsm_rate_data_val = "1";
				}
				if ( $(this).hasClass('wpsm-rate-later') ) {
					var wpsm_rate_data_val =  "2";
					event.preventDefault();
				}
				if ( $(this).hasClass('wpsm-rated') ) {
					var wpsm_rate_data_val =  "3";
					event.preventDefault();
				}

				$.post( ajaxurl, {
					action: 'wpsm_cns_dismiss_review',
					wpsm_rate_data_cns : wpsm_rate_data_val
				});
				
				$('.wpsm-cns-review-notice').hide();
				//location.reload();
			});
		});
	</script>
	<?php
}

add_action( 'wp_ajax_wpsm_cns_dismiss_review', 'wpsm_cns_dismiss_review' );
function wpsm_cns_dismiss_review() {
	if ( ! $review ) {
		$review = array();
	}
	
	if($_POST['wpsm_rate_data_cns']=="1"){
		
	}
	if($_POST['wpsm_rate_data_cns']=="2"){
		$review['time'] 	 = time();
		$review['dismissed'] = false;
		update_option( 'wpsm_cns_review', $review );
	}
	if($_POST['wpsm_rate_data_cns']=="3"){
		$review['time'] 	 = time();
		$review['dismissed'] = true;
		update_option( 'wpsm_cns_review', $review );
	}
	
	die;
}

function wpsm_counter_number_header_info() {
 	if(get_post_type()=="counter_numbers") {
		?>
		<style>
		.wpsm_ac_h_i{
			background:url('<?php echo esc_url(wpshopmart_cns_directory_url.'assets/images/slideshow-01.jpg'); ?>') 50% 0 repeat fixed;
			-webkit-box-shadow: 0px 13px 21px -10px rgba(128,128,128,1);
-moz-box-shadow: 0px 13px 21px -10px rgba(128,128,128,1);
box-shadow: 0px 13px 21px -10px rgba(128,128,128,1);
			
			margin-left: -20px;
			font-family: Myriad Pro ;
			cursor: pointer;
			text-align: center;
		}
		.wpsm_ac_h_i .wpsm_ac_h_b{
			color: white;
			font-size: 30px;
			font-weight: bolder;
			padding: 0 0 15px 0;
		}
		.wpsm_ac_h_i .wpsm_ac_h_b .dashicons{
			font-size: 40px;
			position: absolute;
			margin-left: -45px;
			margin-top: -10px;
		}
		 .wpsm_ac_h_small{
			font-weight: bolder;
			color: white;
			font-size: 18px;
			padding: 0 0 15px 15px;
		}

		.wpsm_ac_h_i a{
		text-decoration: none;
		}
		@media screen and ( max-width: 600px ) {
			.wpsm_ac_h_i{ padding-top: 60px; margin-bottom: -50px; }
			.wpsm_ac_h_i .WlTSmall { display: none; }
		}
		.texture-layer {
			background: rgba(0,0,0,0);
			padding-top: 0px;
			padding: 0px 0 23px 0;
			overflow: hidden;
		}
		.wpsm_ac_h_i  ul{
			padding:0px 20px 0px 15px;
		}
		.wpsm_ac_h_i  li {
			text-align:left;
			color:#fff;
			font-size: 20px;
			line-height: 1.3;
			font-weight: 600;
			
		}
		.wpsm_ac_h_i  li i{
		margin-right:10px ;
margin-bottom:10px;		
		}
		 
		  .wpsm_ac_h_i .btn-danger{
			      font-size: 29px;
				  background-color: #000000;
				  border-radius:1px;
				  margin-right:10px;
				      margin-top: 0px;
					  border-color:#000;
				 
		  }
		  .wpsm_ac_h_i .btn-success{
			      font-size: 28px;
				  border-radius:1px;
				      background-color: #ffffff;
    border-color: #ffffff;
	color:#000;
		  }
		  .btn-danger {
    color: #fff;
    background-color: #000000 !important;
    border-color: #000000 !important;
}
		
		</style>
		<div class="wpsm_ac_h_i ">
			<div class="texture-layer">
				
					<div class="wpsm_ac_h_b"><a class="btn btn-danger btn-lg " href="https://wpshopmart.com/plugins/counter-numbers-pro/" target="_blank"><?php esc_html_e('Buy Counter Number Pro Now',wpshopmart_cns_text_domain); ?></a><a class="btn btn-success btn-lg " href="http://demo.wpshopmart.com/counter-number-pro/" target="_blank"><?php esc_html_e('View Demo',wpshopmart_cns_text_domain); ?></a></div>
					<div style="overflow:hidden;display:block;width:100%;text-align:center">
					<h1 style="color:#fff;font-size:40px;"><?php esc_html_e('Unlock Advance Features In Pro Version Of Counter Number',wpshopmart_cns_text_domain); ?></h1>
					</div>
					<a href="https://wpshopmart.com/plugins/counter-numbers-pro/" target="_blank">
					<div class="row" style="overflow:hidden;width:100%">
						<div class="col-md-3">
							<ul>
								<li> <i class="fa fa-check"></i><?php esc_html_e('23+ Design Templates',wpshopmart_cns_text_domain); ?> </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('10+ Columns Layout Styles',wpshopmart_cns_text_domain); ?> </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('Individual Color Scheme',wpshopmart_cns_text_domain); ?> </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('Add Background image For Section',wpshopmart_cns_text_domain); ?>  </li>
								
							</ul>
						</div>
						<div class="col-md-3">
							<ul>
								<li> <i class="fa fa-check"></i><?php esc_html_e('Background Color Customization',wpshopmart_cns_text_domain); ?>  </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('Parallax Background Section',wpshopmart_cns_text_domain); ?> </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('Add Description for counter',wpshopmart_cns_text_domain); ?> </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('500+ Google Fonts',wpshopmart_cns_text_domain); ?> </li>
								
							</ul>
						</div>
						<div class="col-md-3">
							<ul>
								
							    <li> <i class="fa fa-check"></i><?php esc_html_e('1000+ Font Awesome Icon Support',wpshopmart_cns_text_domain); ?> </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('Widget Option',wpshopmart_cns_text_domain); ?> </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('More Color Settings',wpshopmart_cns_text_domain); ?>  </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('Section padding/space Customization',wpshopmart_cns_text_domain); ?> </li>
							</ul>
						</div>
						<div class="col-md-3">
							<ul>
								<li> <i class="fa fa-check"></i><?php esc_html_e('Border Color Customization',wpshopmart_cns_text_domain); ?> </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('Drag And Drop Builder',wpshopmart_cns_text_domain); ?> </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('High Priority Support',wpshopmart_cns_text_domain); ?> </li>
								<li> <i class="fa fa-check"></i><?php esc_html_e('All Browser Compatible',wpshopmart_cns_text_domain); ?> </li>
							</ul>
						</div>
						
					</div>
					
				</a>
				
				
			</div>
			
		</div>
		<?php  
	}
}
add_action('in_admin_header','wpsm_counter_number_header_info'); 
?>