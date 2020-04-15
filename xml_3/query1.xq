<Xquery>
	<Xquery1>
	{
		for $x in doc("Animation_3.xml")/animation-list/animation
		order by $x/detail/duration ascending
		return <name duration="{data($x/detail/duration)}">{data($x/animeName)}</name>
	}
	</Xquery1>
	<Xquery2>
    {
        for $x in doc("Animation_3.xml")/animation-list/animation
        order by $x/detail/duration descending
        return <name duration="{data($x/detail/duration)}">{data($x/animeName)}</name>
    }
    </Xquery2>
	<Xquery3>
    {
        for $x in doc("Animation_3.xml")/animation-list/animation
        order by year-from-date($x/detail/startTime) descending
        return <name startTime="{data($x/detail/startTime)}">{data($x/animeName)}</name>
    }
    </Xquery3>
	<Xquery4>
    {
        let $animation-list :=(
        for $x in doc("Animation_3.xml")/animation-list/animation
        where year-from-date($x/detail/startTime)>=2010 and year-from-date($x/detail/startTime)<=2019
        return $x
        )
        for $now in $animation-list
        where $now/detail/type/@form = "2D"
        return <name startTime="{data($now/detail/startTime)}" type="{data($now/detail/type/@form)}">{data($now/animeName)}</name>
        
    }
    </Xquery4>
	<Xquery5>
    {
        let $old := doc("Animation_3.xml")/animation-list/animation
        let $new := doc("Animation_4.xml")/animation-list/animation
        for $x in ($new union $old)
        order by year-from-date($x/detail/startTime) descending
        return <name startTime="{data($x/detail/startTime)}" ID="{data($x/@id)}">{data($x/animeName)}</name>
    }
    </Xquery5>
</Xquery>