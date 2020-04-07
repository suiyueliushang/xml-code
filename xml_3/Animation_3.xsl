<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<style>
				h1{
					font-family:"Times New Roman", Times, serif;
					font-size:40pt;
					color: rgba(255, 179, 140,0.5);
					text-shadow: 3px 3px 0 rgba(180,255,0,0.5);
				}
				.main-frame{
					margin-bottom:20px;
					margin-left:20px;
					border:10px solid red;
					height:400px;
					width:1200px;
				}
				.detail_video {
					border:1px solid black;
					min-height: 1px;
					width:800px;
					height:400px;
					float:left;
				}
				.detail_pic {
					border-radius: 8px;
					width:300px;
					height:400px;
				}
				.image_div{
					border:1px solid blue;
					float:left;
					height:400px;
					width:300px;
				}
				.video_title_cn {
					border:1px solid green;
					width:700px;
					margin-left:15px;
					margin-right: 15px;
					color: #111;
					font-size: 28px;
					font-weight: 400;
					line-height: 34px;
				}
				.mod_figure_detail, .video_desc {
					border:1px solid green;
					position: relative;
					max-height: 200px;
					max-width: 600px;
					margin-bottom: 2px;
					overflow: hidden;
					font-size: 12px;
					line-height: 20px;
					text-align: justify;
					text-justify: inter-ideograph;
					margin-left:15px;
					margin-right:15px;
				}
				.mod_figure_detail,.desc_tit {
					border:1px solid green;
					color: #999;
				}
				.mod_figure_detail, .video_tag {
					border:1px solid green;
					margin-bottom: 1px;
					padding-top: 2px;
				}
				.mod_figure_detail, .tag_tit {
					border:1px solid red;
					color: #999;
					font-size: 12px;
					line-height: 20px;
					margin-left: 15px;
					padding: 2px 0;
				}
				.mod_figure_detail, .tag_list, .tag {
					display: inline-block;
					position: relative;
					top: -1px;
					margin-right: 5px;
					padding: 0 5px;
					border: 1px solid #ccc;
					border-radius: 2px;
					background: #fff;
					color: #ff5c38;
					font-size: 12px;
					line-height: 16px;
				}
				
			</style>
			<title>
				13@一直自闭 实验3
			</title>
			<h1 align='center'>
				精选国内外动漫	
			</h1>
			<body>
				<xsl:apply-templates select='/animation-list/animation'/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match='/animation-list/animation'>
	<div class='main-frame'>
		<div class='image_div'>
			<img class='detail_pic' alt="海报">
				<xsl:attribute name='src'>
					<xsl:value-of select='current()/detail/posterSrc'/>
				</xsl:attribute>
			</img>
		</div>
		<div class='detail_video'>
			<h2 class='video_title_cn'>
				<xsl:value-of select="current()/animeName"/>
			</h2>
			<br />
			<div class="video_tag cf">
				<span class="tag_tit">标　签: </span>
				<div class="tag_list">
					
					
				</div>
			</div>
			<div class ='video_desc'>
				<span class="desc_tit">简　介：</span>
				<span class="txt _desc_txt_lineHight" itemprop="description">
					<xsl:value-of select='detail/animeIntroduction'></xsl:value-of>
				</span>
			</div>
			<!-- <a href="http://v.qq.com/x/cover/mzc002001kt6n30.html" class="btn_primary btn_primary_md " 
			target="scene=%E8%AF%A6%E6%83%85%E9%A1%B5&amp;pagename=%E9%A1%B5%E9%A6%96&amp;controlname=%E7%AB%8B%E5%8D%B3%E6%92%AD%E6%94%BE&amp;cid=mzc002001kt6n30&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=0&amp;cmd=1&amp;plat_bucketid=9231002" _stat="info:playbtn">
				<svg class="svg_icon svg_icon_play_sm icon_sm" viewBox="0 0 16 16" width="16" height="16">
					<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg_icon_play_sm">
					</use>
				</svg>
				<span class="icon_text">立即播放</span>
			</a> -->
		</div>
	</div>
	</xsl:template>

	
	
</xsl:stylesheet>

