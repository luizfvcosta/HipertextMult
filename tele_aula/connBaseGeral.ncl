<?xml version="1.0" encoding="ISO-8859-1"?>
<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 !   CONECTORES - base de conectores
 !  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
<ncl id="connBaseGeral" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">

<head>
	<connectorBase>
		<!-- Inicia uma mídia no imicio de outra -->
		<causalConnector id="onBeginStart">     
			<simpleCondition role="onBegin"/>     
			<simpleAction role="start" max="unbounded" qualifier="par"/>    
		</causalConnector> 
		
		<causalConnector id="onBeginStart_delay">     
			<connectorParam name="aDelay"/>     
			<simpleCondition role="onBegin"/>     
			<simpleAction role="start" delay="$aDelay" max="unbounded"  qualifier="par"/>    
		</causalConnector>

		<causalConnector id="onEndStop">     
			<simpleCondition role="onEnd"/>     
			<simpleAction role="stop" max="unbounded" qualifier="par"/>    
		</causalConnector>
		
		<causalConnector id="onEndResume">     
			<simpleCondition role="onEnd"/>     
			<simpleAction role="resume" />    
		</causalConnector>

		<causalConnector id="onBeginSet_varStart">     
			<connectorParam name="var"/>     
			<simpleCondition role="onBegin"/>     
			<compoundAction operator="seq">      
				<simpleAction role="set" value="$var"/>      
				<simpleAction role="start" max="unbounded" qualifier="par"/>     
			</compoundAction>     
		</causalConnector> 

		<causalConnector id="onKeySelectionStopSet_varStart">     
			<connectorParam name="var"/>     
			<connectorParam name="keyCode"/>     
			<simpleCondition role="onSelection" key="$keyCode"/>     
			<compoundAction operator="seq">      
				<simpleAction role="stop" max="unbounded"  qualifier="par"/>      
				<simpleAction role="set" value="$var"/>      
				<simpleAction role="start" max="unbounded" qualifier="par"/>     
			</compoundAction>        
		</causalConnector>
		
		<causalConnector id="onEndSet_var">     
			<connectorParam name="var"/> 
			<simpleCondition role="onEnd"/>     
			<simpleAction role="set" value="$var"/>    
		</causalConnector> 
		  
		<causalConnector id="onKeySelectionStartStop"> 
			<simpleCondition role="onSelection" /> 
			<compoundAction operator="par"> 
				<simpleAction role="start" /> 
				<simpleAction role="stop" /> 
			</compoundAction> 
		</causalConnector>   

		
		<causalConnector id="onKeySelectionSet_var">     
			<connectorParam name="keyCode"/>     
			<connectorParam name="var"/>     
			<simpleCondition role="onSelection" key="$keyCode"/>     
			<simpleAction role="set" value="$var"/>    
		</causalConnector> 
		
		<causalConnector id="onBeginVarStart">     
			<compoundCondition operator="and">      
				<simpleCondition role="onBegin"/>      
				<assessmentStatement comparator="eq">       
					<attributeAssessment role="var" attributeType="nodeProperty" eventType="attribution"/>       
					<valueAssessment value="true"/>      
				</assessmentStatement>     
			</compoundCondition>     
			<simpleAction role="start"/>    
		</causalConnector>
		
		<causalConnector id="onBeginStartSet_var_delay_duration">     
			<connectorParam name="var"/>     
			<connectorParam name="delay"/>     
			<connectorParam name="duration"/>     
			<simpleCondition role="onBegin"/>     
			<compoundAction operator="seq">      
				<simpleAction role="start"/>      
				<simpleAction role="set" value="$var" delay="$delay" duration="$duration"/>     
			</compoundAction>     
		</causalConnector>
		
		<causalConnector id="onSelectionSet_varStop">     
			<connectorParam name="var"/>     
			<simpleCondition role="onSelection"/>     
			<compoundAction operator="seq">      
				<simpleAction role="set" value="$var" max="unbounded" qualifier="par"/>      
				<simpleAction role="stop"/>      
			</compoundAction>        
		</causalConnector>
		
		<causalConnector id="onSelection_orSet_varStopStart">     
			<connectorParam name="var"/>     
			<simpleCondition role="onSelection" qualifier="or" max="unbounded"/>     
			<compoundAction operator="seq">      
				<simpleAction role="set" value="$var" max="unbounded" qualifier="par"/>      
				<simpleAction role="stop"/>      
				<simpleAction role="start"/>     
			</compoundAction> 
		</causalConnector>
		
		<causalConnector id="onBeginSet_var"> 
			<connectorParam name="var"/> 
			<simpleCondition role="onBegin"/> 
			<simpleAction role="set" value="$var"/> 
		</causalConnector>
		
		<causalConnector id="onEndSet_varStop_delay"> 
			<connectorParam name="var"/> 
			<simpleCondition role="onEnd"/> 
			<compoundAction operator="seq"> 
				<simpleAction role="set" value="$var"/> 
				<simpleAction role="stop" max="unbounded" qualifier="par" delay="3s"/> 
			</compoundAction> 
		</causalConnector>
		
		<causalConnector id="onKeySelectionStop">
            <connectorParam name="aKey"/>
            <simpleCondition role="onSelection" key="$aKey"/>
            <simpleAction role="stop"/>
        </causalConnector>
	
		<causalConnector id="onEndStart">
            <simpleCondition role="onEnd"/>
			<simpleAction role="start"/>
         </causalConnector>
		
		<causalConnector id="onEndStart_delay">
			<connectorParam name="aDelay"/>
            <simpleCondition role="onEnd"/>
			<compoundAction operator="seq">
				<simpleAction role="start" max="unbounded" qualifier="par" delay="aDelay"/>
			</compoundAction> 
         </causalConnector>

	
	</connectorBase>
	
	
	
</head>

</ncl>
