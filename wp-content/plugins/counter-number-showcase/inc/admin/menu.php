<?php
if ( ! defined( 'ABSPATH' ) ) exit;
class wpsm_cns_misha
{
	private static $instance;
    public static function forge() {
        if (!isset(self::$instance)) {
            $className = __CLASS__;
            self::$instance = new $className;
        }
        return self::$instance;
    }
	private function __construct() 
	{
		add_action('admin_enqueue_scripts', array(&$this, 'counter_number_scripts'));
        if (is_admin()) 
		{
			add_action('init', array(&$this, 'counter_num_register_cpt'), 1);
			add_action('add_meta_boxes', array(&$this, 'counter_num_meta_boxes_group'));
			add_action('admin_init', array(&$this, 'counter_num_meta_boxes_group'), 1);
			add_action('save_post', array(&$this, 'add_Counter_num_meta_box_save'), 9, 1);
			add_action('save_post', array(&$this, 'add_Counter_num_meta_box_settings_save'), 9, 1);
		}
    }
	// admin scripts
	public function counter_number_scripts(){
		if(get_post_type()=="counter_numbers"){
			require_once('script.php');
		}
	}
	
	public function counter_num_register_cpt()
	{
		require_once('cpt-reg.php');
		add_filter( 'manage_counter_numbers_posts_columns', array(&$this, 'wpsm_counter_columns' )) ;
		add_action( 'manage_counter_numbers_posts_custom_column', array(&$this, 'wpsm_counter_manage_columns' ), 10, 2 );
	}
	function wpsm_counter_columns($columns ){
        $columns = array(
            'cb' => '<input type="checkbox" />',
            'title' => __( 'Counterbox' ),
            'shortcode' => __( 'Counter Shortcode' ),
            'date' => __( 'Date' )
        );
        return $columns;
    }
   function wpsm_counter_manage_columns( $column, $post_id ){
        global $post;
        switch( $column ) {
          case 'shortcode' :
            echo '<input style="width:225px" type="text" value="[COUNTER_NUMBER id='.esc_html($post_id).']" readonly="readonly" />';
            break;
          default :
            break;
        }
    }	
	// add metaboxes
	public function counter_num_meta_boxes_group(){		
		add_meta_box('wpsm_cn_box_support', __('Get Support', wpshopmart_cns_text_domain), array(&$this, 'wpsm_cn_box_support_function'), 'counter_numbers', 'side', 'low');
		add_meta_box('Counter_settings', __('Counter Settings', wpshopmart_cns_text_domain), array(&$this, 'CN_box_Settings_callback_function'), 'counter_numbers', 'side', 'low' );
		add_meta_box('wpsm_cn_box_rateus', __('Rate Us If You Like This Plugin', wpshopmart_cns_text_domain), array(&$this, 'cn_box_rateus_meta_box_function'), 'counter_numbers', 'side', 'low');
		
		add_meta_box('Counter_box', __('Add Counter Box', wpshopmart_cns_text_domain), array(&$this, 'add_CN_box_callback_function'), 'counter_numbers', 'normal', 'low' );
		add_meta_box('Counter_box_shortcode', __('Counter box Shortcode', wpshopmart_cns_text_domain), array(&$this, 'wpsm_pic_counterbox_shortcode'), 'counter_numbers', 'normal', 'low');
		add_meta_box ('Counter_box_help', __('Help From Wpshopmart', wpshopmart_cns_text_domain), array(&$this, 'wpsm_pic_counterbox_help'), 'counter_numbers', 'normal', 'low');
		
		add_meta_box ('Counter_box_more_pro', __('More Pro Plugin From Wpshopmart', wpshopmart_cns_text_domain), array(&$this, 'wpsm_pic_counterbox_more_pro'), 'counter_numbers', 'normal', 'low');

	}
	 public function cn_box_rateus_meta_box_function(){
		
		?>
		<style>
		#wpsm_cn_box_rateus{
			background:#dd3333;
			text-align:center
			}
			.handle-order-higher, .handle-order-lower{
				display:none;
			}
			#wpsm_cn_box_rateus .hndle , #wpsm_cn_box_rateus .handlediv{
			display:none;
			}
			#wpsm_cn_box_rateus h1{
			    color: #fff;
				border-bottom: 1px dashed rgba(255, 255, 255,0.9);
				padding-bottom: 10px;
			}
			 #wpsm_cn_box_rateus h3 {
			color:#fff;
			font-size:15px;
			}
			#wpsm_cn_box_rateus .button-hero{
			display:block;
			text-align:center;
			margin-bottom:15px;
			background:#fff !important;
			color:#000 !important;
			box-shadow:none;
			text-shadow:none;
			font-weight:600;
			font-size:18px;
			border:0px;
			}
			.wpsm-rate-us{
			text-align:center;
			}
			.wpsm-rate-us span.dashicons {
				width: 40px;
				height: 40px;
				font-size:20px;
				color:#fff !important;
			}
			.wpsm-rate-us span.dashicons-star-filled:before {
				content: "\f155";
				font-size: 40px;
			}
		</style>
		   <h1><?php esc_html_e('Rate Us',wpshopmart_cns_text_domain); ?></h1>
			<h3><?php esc_html_e('Show us some love, If you like our product then please give us some valuable feedback on wordpress',wpshopmart_cns_text_domain); ?></h3>
			<a href="https://wordpress.org/support/plugin/counter-number-showcase/reviews/?filter=5" target="_blank" class="button button-primary button-hero "><?php esc_html_e('RATE HERE',wpshopmart_cns_text_domain); ?></a>
			<a class="wpsm-rate-us" style=" text-decoration: none; height: 40px; width: 40px;" href="https://wordpress.org/support/plugin/counter-number-showcase/reviews/?filter=5" target="_blank">
				<span class="dashicons dashicons-star-filled"></span>
				<span class="dashicons dashicons-star-filled"></span>
				<span class="dashicons dashicons-star-filled"></span>
				<span class="dashicons dashicons-star-filled"></span>
				<span class="dashicons dashicons-star-filled"></span>
			</a>
	<?php
	}
	
	public function wpsm_cn_box_support_function(){
		?>
		<style>
		
			#wpsm_cn_box_support{
			background:#3338dd;
			text-align:center
			}
			#wpsm_cn_box_support .hndle , #wpsm_cn_box_support .handlediv{
			display:none;
			}
			#wpsm_cn_box_support h1{
			    color: #fff;
				border-bottom: 1px dashed rgba(255, 255, 255,0.9);
				padding-bottom: 10px;
			}
			 #wpsm_cn_box_support h3 {
			color:#fff;
			font-size:15px;
			}
			#wpsm_cn_box_support .button-hero{
			background: #efda4a;
    color: #312c2c;
    box-shadow: none;
    text-shadow: none;
    font-weight: 500;
    font-size: 22px;
    border: 1px solid #efda4a;
			}
			.wpsm-rate-us{
			text-align:center;
			}
			.wpsm-rate-us span.dashicons {
				width: 40px;
				height: 40px;
				font-size:20px;
				color:#fff !important;
			}
			.wpsm-rate-us span.dashicons-star-filled:before {
				content: "\f155";
				font-size: 40px;
			}
		</style>	
		<h1><?php esc_html_e('Follow Us On',wpshopmart_cns_text_domain); ?></h1>
		   <h3><?php esc_html_e('Youtube To Grab Free Web design Course & WordPress Help/Tips',wpshopmart_cns_text_domain); ?></h3>
			<a href="https://www.youtube.com/c/wpshopmart" target="_blank"><img style="width:200px;height:auto" src="<?php echo esc_url(wpshopmart_cns_directory_url.'assets/images/youtube.png'); ?>" /></a>
			<a href="https://www.youtube.com/c/wpshopmart?sub_confirmation=1" target="_blank" class="button button-primary button-hero "><?php esc_html_e('Subscribe Us Now',wpshopmart_cns_text_domain); ?></a>
			
			<?php 
	}
	public function add_Counter_num_meta_box_settings_save($PostID)
	{
		require('data-post/Counter-save-data-settings.php');
	}
	public function add_Counter_num_meta_box_save($PostID)
	{
		require('data-post/Counter-save-data.php');
	}
	public function add_CN_box_callback_function($post)
	{
		require('add-counter-box.php');
	}
	public function CN_box_Settings_callback_function($post)
	{
		require('settings.php');
	}
	
	public function wpsm_pic_counterbox_more_pro(){
		require_once('more-pro.php');
	}
	
	public function wpsm_pic_counterbox_help(){
		require_once('help.php');
	}
	
	public function wpsm_pic_counterbox_shortcode()
	{?>
	<style>
			#Counter_box_shortcode{
			background:#fff!important;
			box-shadow: 0 0 20px rgba(0,0,0,.2);
			}
			#Counter_box_shortcode .hndle , #Counter_box_shortcode .handlediv{
			display:none;
			}
			#Counter_box_shortcode p{
			color:#000;
			font-size:15px;
			}
			#Counter_box_shortcode input {
			font-size: 16px;
			padding: 8px 10px;
			width:100%;
			}
			.customcss-title{
				background: #000;
				padding: 10px;
				margin: 0px;
				color: #fff;
				font-size: 18px;
			}
		</style>
		<h3><?php esc_html_e('Counter Number Shortcode',wpshopmart_cns_text_domain); ?></h3>
		<p><?php _e("Use below shortcode in any Page/Post to publish your Colorbox", wpshopmart_cns_text_domain);?></p>
		<input readonly="readonly" style="font-size:25px;" type="text" value="<?php echo "[COUNTER_NUMBER id=".get_the_ID()."]"; ?>">
		<br/>
		<br/>
		<br/>
		<?php
		 $PostId = get_the_ID();
		$Counter_Meta_Settings = unserialize(get_post_meta( $PostId, 'Counter_Meta_Settings', true));
		if(isset($Counter_Meta_Settings['custom_css'])){    
		     $custom_css   = $Counter_Meta_Settings['custom_css'];
		}
		else{
		$custom_css="";
		}		
		?>
		<h3 class="customcss-title"><?php esc_html_e('Custom Css',wpshopmart_cns_text_domain); ?></h3>
		<textarea name="custom_css" id="custom_css"  style="width:100% !important ;height:300px;background:#ECECEC;" ><?php echo esc_html($custom_css) ; ?></textarea>
		<p><?php esc_html_e('Enter Css without ',wpshopmart_cns_text_domain); ?><strong>&lt;style&gt; &lt;/style&gt; </strong><?php esc_html_e(' tag',wpshopmart_cns_text_domain); ?></p>
		<br>
		<script>
		  var editor = CodeMirror.fromTextArea(document.getElementById("custom_css"), {
		   lineNumbers: true,
		   styleActiveLine: true,
			matchBrackets: true,
			hint:true,
			theme : 'ambiance',
			extraKeys: {"Ctrl-Space": "autocomplete"},
		  });
		</script>
		<?php if(isset($Counter_Meta_Settings['custom_css'])){ ?> 
		
		<div class="wpsm_site_sidebar_widget_title">
			<h4><?php esc_html_e('Counter Number Default Settings Option',wpshopmart_cns_text_domain); ?></h2>
		</div>
		<h3><?php esc_html_e('Add This Counter Number settings as default setting for new Counterbox',wpshopmart_cns_text_domain); ?></h3>
		<div class="">
			<a  class="button button-primary button-hero" name="updte_wpsm_counter_default_settings" id="updte_wpsm_counter_default_settings" onclick="updte_wpsm_counter_default_settings()"><?php esc_html_e('Update Default Settings',wpshopmart_cns_text_domain); ?></a>
		</div>	
		<?php
		}		
	}
}
global $wpsm_cns_misha;
$wpsm_cns_misha = wpsm_cns_misha::forge();
?>