<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body style="background-size: 100%; background-image: url(https://i0.hdslb.com/bfs/activity-plat/static/30cb1f6c4bfeb93761cf35c27d9b88cb/IHqiIVbz0_w1920_h1280.jpg); background-attachment: fixed; background-repeat: no-repeat; background-color: #000000;">
                <xsl:apply-templates select='/animation-list/animation[12]'/>
            </body>
        </html>
        <style>
            h1{
                font-family:"Times New Roman", Times, serif;
                font-size:35pt;
                color: rgba(255, 255, 255,1);
            }
            .poster_title
            {
                position:relative;
                box-sizing:border-box;
                height:257px;
                overflow:hidden;
                min-width:1280px;
                display:block;
                z-index:auto
            }
            .poster_title_layout
            {
                position:relative;
                height:100%
            }

        </style>
    </xsl:template>
    <xsl:template match='/animation-list/animation'>
        <section style="poster_title" class="container-wrapper">
            <div class="t-space-container" style="position:relative;height:240px;box-sizing:border-box;padding-top:0px;padding-bottom:0px;padding-left:0px;padding-right:0px;margin:0 auto;width:1280px">
                <div style="poster_title_layout" data-container="section" data-module="DiyBox">
                    <div style="background-size: cover; background-repeat: no-repeat; background-position: center center; height: 173px; width: 416px; padding: 0px; margin: 0px; left: 432px; top: 70px; z-index: auto; box-sizing: border-box; position: absolute;" data-fid="Mr_I8UEqbH" class="container-wrapper">
                        <h1 align='center' font-color='#FFFFFF'>
                                精选搞笑动漫	
                        </h1>
                    </div>
                </div>
            </div>
        </section>
        <section style="position:relative;box-sizing:border-box;height:490px;overflow:hidden;min-width:1280px;display:block;z-index:auto">
            <div class="t-space-container" style="position:relative;height:100%;box-sizing:border-box;padding-top:0px;padding-bottom:0px;padding-left:0px;padding-right:0px;margin:0 auto;width:1280px">
                <div style="position:relative;height:100%">
                    <div style="background-color: rgba(0,0,0,0.5);background-size: cover;background-repeat: no-repeat;background-position: center center;height: 481px;width: 1013px;padding: 0px;margin: 0px;left: 133px;top: 0px;z-index: auto;box-sizing: border-box;position: absolute;">
                    <div style="border:2px solid purple;background-size:cover;background-repeat:no-repeat;background-position:center;height:446px;width:336px;padding:0;margin:0;left:20px;top:19px;z-index:auto;box-sizing:border-box;position:absolute">
                        <img style='height:442px;width:332px;display:block;'>
                            <xsl:attribute name='alt'>
                                <xsl:value-of select='current()/animeName'/>
                            </xsl:attribute>
                            <xsl:attribute name='src'>
                                <xsl:value-of select='current()/detail/posterSrc'/>
                            </xsl:attribute>
                        </img>
                    </div>
                    </div>
                    <div style="background: #4169E1;border:2px solid purple;background-size:cover;background-repeat:no-repeat;background-position:center;height:80px;width:220px;padding:0;margin:0;right:160px;top:22px;z-index:auto;box-sizing:border-box;position:absolute">
                        <div style='float:right;margin-top:10px;margin-right:10px;font-size:18pt;font-weight:bold;color: rgba(255, 255, 255,1);'>
                            制作公司
                        </div>
                        <div style='float:right;margin-top:2px;margin-right:10px;font-size:22pt;font-weight:bold;color: rgba(255, 255, 255,1);'>
                            A-1 Pictures
                        </div>
                    </div>
                    <div style="border:2px solid white;background-size:cover;background-repeat:no-repeat;height:114px;width:562px;padding:0;margin:0;left:529px;top:129px;z-index:auto;box-sizing:border-box;position:absolute">
                        <p style="line-height:52px;margin-top:0px;font-family: Microsoft Yahei;font-size:38pt;font-weight:3000;color: rgba(255, 255, 255,1);'">
                            辉夜大小姐想让我告白?~天才们的恋爱头脑战~
                        </p>
                    </div>
                    <div style="font-size:16pt;font-weight:bold;color: rgba(255, 255, 255,1);background-size:cover;background-repeat:no-repeat;height:114px;width:562px;padding:0;margin:0;left:529px;top:300px;z-index:auto;box-sizing:border-box;position:absolute">
                        <span>制片人：</span>
                        <span>
                            <xsl:value-of select='current()/detail/director'/>
                        </span>
                    </div>
                    <div style="font-size:16pt;font-weight:bold;color: rgba(255, 255, 255,1);background-size:cover;background-repeat:no-repeat;height:114px;width:562px;padding:0;margin:0;left:529px;top:340px;z-index:auto;box-sizing:border-box;position:absolute">
                        <span>总集数：</span>
                        <span>
                            <xsl:value-of select='current()/detail/totalEpisodes'/>
                        </span>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>
</xsl:stylesheet>