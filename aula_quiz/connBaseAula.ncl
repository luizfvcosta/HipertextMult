<?xml version="1.0" encoding="ISO-8859-1"?>
<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 !   CONECTORES - base de conectores
 !  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
<ncl id="connBaseAula" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">

<head>
	<connectorBase>
		<causalConnector id="onBeginStart">     
			<simpleCondition role="onBegin"/>     
			<simpleAction role="start" max="unbounded" qualifier="par"/>    
		</causalConnector> 
		
		<causalConnector id="onBeginStop">     
			<simpleCondition role="onBegin"/>     
			<simpleAction role="stop" max="unbounded" />    
		</causalConnector> 
		
		<causalConnector id="onEndStop">
			<simpleCondition role="onEnd"/>
			<simpleAction role="stop" max="unbounded"/>
		</causalConnector>
		
		<causalConnector id="onEndStart">
			<simpleCondition role="onEnd"/>
			<simpleAction role="start" max="unbounded" qualifier="par"/>    
		</causalConnector>
		
		
		<causalConnector id="onSelectionStopSet">
			<simpleCondition role="onSelection"/>
			<connectorParam name="var"/>
			<compoundAction operator="seq">
				<simpleAction role="set" value="$var"/>
			</compoundAction>
			<simpleAction role="stop"/>
		</causalConnector>
		
		<causalConnector id="onEndStopSet">
			<simpleCondition role="onEnd"/>
			<simpleAction role="stop" max="unbounded"/>
			<connectorParam name="var"/>
			<compoundAction operator="seq">
				<simpleAction role="set" value="$var"/>
			</compoundAction>
		</causalConnector>
		
		
		<causalConnector id="onEndStopSetStart">
			<simpleCondition role="onEnd"/>
			<simpleAction role="stop" max="unbounded"/>
			<connectorParam name="var"/>
			<compoundAction operator="seq">
				<simpleAction role="set" value="$var"/>
			</compoundAction>
			<simpleAction role="start" max="unbounded" qualifier="par"/>  
		</causalConnector>
		
		<causalConnector id="onEndStopStart">
			<simpleCondition role="onEnd"/>
			<simpleAction role="stop" max="unbounded"/>
			<simpleAction role="start" max="unbounded" qualifier="par"/>  
		</causalConnector>
		
		
		<causalConnector id="onKeySelectionStop">
            <connectorParam name="aKey"/>
            <simpleCondition role="onSelection" key="$aKey"/>
            <simpleAction role="stop"/>
        </causalConnector>
		
		<causalConnector id="onSelectionStop">
			<simpleCondition role="onSelection"/>
			<simpleAction role="stop"/>
		</causalConnector>
		
		<causalConnector id="onSelectionStartStop">
			<simpleCondition role="onSelection"/>
			<simpleAction role="start"/>
			<simpleAction role="stop"/>
		</causalConnector>
		
		<causalConnector id="onEndStopStart_delay">     
			<connectorParam name="aDelay"/>     
			<simpleCondition role="onEnd"/> 
			<simpleAction role="stop" max="unbounded" />
			<simpleAction role="start" delay="$aDelay" max="unbounded"  qualifier="par"/>    
		</causalConnector>
		
		<causalConnector id="onBeginstop_delay">     
			<connectorParam name="aDelay"/>     
			<simpleCondition role="onBegin"/> 
			<simpleAction role="stop" delay="$aDelay" max="unbounded"  />
		</causalConnector>
		
		<causalConnector id="onBeginStop_delayStart">     
			<connectorParam name="aDelay"/>     
			<simpleCondition role="onBegin"/> 
			<simpleAction role="stop" delay="$aDelay" max="unbounded"  qualifier="par"/> 
			<simpleAction role="start" delay="$aDelay" max="unbounded" /> 		
		</causalConnector>

	
	</connectorBase>
	
	
	
</head>

</ncl>
