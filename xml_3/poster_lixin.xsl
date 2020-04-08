<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match='/'>
		<html>
			<link REL="Stylesheet" HREF="./poster.css" TYPE="text/css"/>
			<title>
				lixinのposter
			</title>
			<body class='body_back'>
				<div class='main_div'>
					<div class='motto_desc'>
						<div class='team_detail_frame_left'>
							<p>
								咸鱼也有翻身的时候呢！
							</p>
							<div>
								<p>创建时间：<xsl:value-of select='/poster/team/start_time'/>
								</p>
								<p>
									leader:喻泽弘	member:李鑫
								</p>
							</div>
						</div>
						<div class='team_detail_frame_right'>
							team_detail_frame_right
						</div>
					</div>
					<div class='leader_frame'>
						<div class='leader_frame_left'>
							<p >
								team leader 喻泽弘
							</p>
							<p class='team_leader'>
								兴趣：打游戏、看电影
								<br />
								QQ：1161018109
								<br />
								Tel：15651833082
								<br/>
								Birth:3.29
							</p>
						</div>
						<div class='leader_frame_right'>
							<img class='touxiang_detail' src='../asset/touxiang.jpg' alt='头像'/>
						</div>
					</div>
					<div class='my_frame'>
						<div class='my_font'>
							member: 李鑫
							<p class='detail_font'>
								hobby：看动漫、玩游戏
								<br />
								QQ：2837644648
							</p>
						</div>
						<div float="left">
							<img src='../asset/lx.jpg' alt='头像' class='my_image'/>
						</div>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>