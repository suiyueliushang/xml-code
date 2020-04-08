<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match='/animation-list/animation'>
		<html>
			<link REL="Stylesheet" HREF="./advertise.css" TYPE="text/css"/>
			<title>	
				advertisement-><xsl:value-of select='animeName'/>
			</title>
			<body>
				<div class='lyric_desc'>
					<p>
						看流沙聚散
						<br/>
						回首天涯路远
						<br/>
						英雄何用声声叹
						<br/>
						断碑落残垣
						<br/>
						君不见青山
						<br/>
						豪杰冢化尘烟  ------------霍尊
					</p>
				</div>
				<div class='comment_desc'>
					<xsl:value-of select='comment'/>
				</div>
				<div class='main_desc'>
					<p>
						导演 <xsl:value-of select='detail/director'/>
						<br/>
						---------------------------------------
						<br/>
						编剧 <xsl:value-of select='detail/screenwriter'/>
						<br/>
						---------------------------------------
						<br/>
						上映日期 <xsl:value-of select='detail/startTime'/>
						<br/>
						---------------------------------------
						<br/>
						总集数 <xsl:value-of select='detail/totalEpisodes'/>
						<br/>
					</p>
					<span class='video_score'>
						<xsl:for-each select='detail/score'>
							<p>
								<span class='font'><xsl:value-of select='current()/@platform'/></span>   
								<xsl:value-of select='current()'/>
								<br/>
							</p>
						</xsl:for-each>
					</span>
				</div>
			</body>
		</html>

	</xsl:template>
</xsl:stylesheet>