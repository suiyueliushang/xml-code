<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<link REL="Stylesheet" HREF="./Animation_3.css" TYPE="text/css"/>
			
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
					<xsl:for-each select='detail/type/label'>
						<div class="tag"  ><xsl:value-of select='current()'/></div>
					</xsl:for-each>
				</div>
				
			</div>
			<div class ='video_desc'>
				<span class="desc_tit">简　介：</span>
				<span class="txt _desc_txt_lineHight" itemprop="description">
					<xsl:value-of select='detail/animeIntroduction'></xsl:value-of>
				</span>
			</div>
			<div class ='video_desc'>
				<span class="desc_tit">评　价：</span>
				<span class="txt _desc_txt_lineHight" itemprop="description">
					<xsl:value-of select='comment'/>
				</span>
			</div>
			<!-- <mat-tab-group mat-stretch-tabs class="example-stretched-tabs mat-elevation-z4">
				<mat-tab label="First"> Content 1 </mat-tab>
				<mat-tab label="Second"> Content 2 </mat-tab>
				<mat-tab label="Third"> Content 3 </mat-tab>
			  </mat-tab-group> -->
			  
			<!-- <a href="http://v.qq.com/x/cover/mzc002001kt6n30.html" class="btn_primary btn_primary_md " 
			target="scene=%E8%AF%A6%E6%83%85%E9%A1%B5&amp;pagename=%E9%A1%B5%E9%A6%96&amp;controlname=%E7%AB%8B%E5%8D%B3%E6%92%AD%E6%94%BE&amp;cid=mzc002001kt6n30&amp;vid=&amp;pid=&amp;datatype=1&amp;playertype=1&amp;controlidx=0&amp;cmd=1&amp;plat_bucketid=9231002" _stat="info:playbtn">
				<svg class="svg_icon svg_icon_play_sm icon_sm" viewBox="0 0 16 16" width="16" height="16">
					<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg_icon_play_sm">
					</use>
				</svg>
				<span class="icon_text">立即播放</span>
			</a> -->
			<div class='media_desc'>
				<xsl:for-each select='current()/resource'>
					<div class='media-info-count'>
						<xsl:choose>
							<xsl:when test='position() = 1'>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="src"/>
									</xsl:attribute>
									<img src='../asset/tenct.svg' alt='腾讯视频' height='50px'/>
								</a>
								<br/>
								
							</xsl:when>
							<xsl:when test='position() = 2'>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="src"/>
									</xsl:attribute>
									<img src='../asset/bilibili.svg' alt='bilibili' height='50px'/>
								</a>
								<br/>
							</xsl:when>
							<xsl:when test='position() = 3'>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="src"/>
									</xsl:attribute>
									<img src='../asset/qiy.svg' alt='爱奇艺' height='50px'/>
								</a>
								<br/>
							</xsl:when>
							<xsl:otherwise>
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="src"/>
									</xsl:attribute>
									<img src='../asset/youku.svg' alt='优酷' height='50px'/>
								</a>
								<br/>
							</xsl:otherwise>
							
						</xsl:choose>
						<br/>
						<span class='tag_tit'>v v: </span> 
						<span class='_desc_txt_lineHight'><xsl:value-of select='vv'/></span>
						<br/>
						<span class='score_desc'>
							<xsl:value-of select='../detail/score'/>
						</span>
					</div>
				</xsl:for-each>
			</div>
		</div>
	</div>
	</xsl:template>
</xsl:stylesheet>

