<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="telecurso" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">

<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 !  CABEÇALHO DO PROGRAMA
 !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

   <head>
      <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       !  BASE DE REGIÕES:
       !  define as regiões na tela onde as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

      <regionBase>
		<region id="backgroundReg" width="100%" height="100%" zIndex="1" >
			<region id="rgVideo" width="88%" height="88%" left="5%" zIndex="2"/>
			<region id="rgBotao" right="5%" bottom="5%" width="200" height="45" zIndex="3"/>
			<region id="changesReg" left="2%" top="10%" width="50" height="10%" zIndex="4" />
			<region id="rfinalscore" left="0%" top="90%" width="100%" height="10%" zIndex="4"/>
		</region>
		<region id="rgMenu" top="90%" width="100%" height="300"  zIndex="99"> 
			<region id="rgMenuItem1" left="5%"   width="150"  height="50"  /> 
			<region id="rgMenuItem2" left="30%"  width="150" height="50"  /> 
			<region id="rgMenuItem3" left="55%"  width="150" height="50" /> 
			<region id="rgMenuItem4" left="80%"  width="150" height="50"  /> 
		</region>
		
      </regionBase>

      <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       !  BASE DE DESCRITORES:
       !  define como as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

      <descriptorBase>
        <descriptor id="dVideo" region="rgVideo" explicitDur="697s"/>
		<descriptor id="dVideo2" region="rgVideo" />
		<descriptor id="dFinal" region="rgVideo" />
		<descriptor id="dBotao" region="rgBotao"/>
		<descriptor id="dMenuItem1" region="rgMenuItem1" focusIndex="2" moveRight="3" moveLeft="5"/>
        <descriptor id="dMenuItem2" region="rgMenuItem2" focusIndex="3" moveRight="4" moveLeft="2"/>
        <descriptor id="dMenuItem3" region="rgMenuItem3" focusIndex="4" moveRight="5" moveLeft="3"/>
        <descriptor id="dMenuItem4" region="rgMenuItem4" focusIndex="5" moveRight="2" moveLeft="4"/>
		<descriptor id="doptA" region="rgMenuItem1"/>
		<descriptor id="doptB" region="rgMenuItem2"/>
		<descriptor id="doptC" region="rgMenuItem3"/>
		<descriptor id="doptD" region="rgMenuItem4"/>
		<descriptor id="changesDesc" region="changesReg" explicitDur="3s" /> 
		<descriptor id="dfinalscore" region="rfinalscore" explicitDur="6s" /> 
      </descriptorBase>
	  
	  <connectorBase>
		<importBase  alias="conn"  documentURI="connBaseGeral.ncl" />
		
		<causalConnector id="onKeySelectionStartStop"> 
			<simpleCondition role="onSelection" /> 
			<compoundAction operator="par"> 
				<simpleAction role="start" /> 
				<simpleAction role="abort" />		
			</compoundAction> 
		</causalConnector>
		
		<causalConnector id="onSelectionStop"> 
			<simpleCondition role="onSelection" /> 
			<simpleAction role="stop" /> 		 
		</causalConnector>
		
		<causalConnector id="onSelectionSet_var">     
			<connectorParam name="var"/>     
			<simpleCondition role="onSelection"/>     
			<compoundAction operator="seq">      
				<simpleAction role="set" value="$var" max="unbounded" qualifier="par"/>           
			</compoundAction>        
		</causalConnector>
	
      </connectorBase>
	  
	  
   </head>

   <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    !  CORPO DO PROGRAMA:
    !   define as mídias e estrutura do programa
    !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

   <body>

      <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      !  PORTAS:
      !  indicam os componentes visíveis externamente e 
      !  iniciados por default
      !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
		<port id="pCtx"   component="ctxAula"/>
		
		<context  id="ctxAula">
			<port id="pVideoAbertura" component="videoAbertura"/>

			<media id="videoAbertura" src="media/telecursoAula.mp4" descriptor="dVideo" />
			<media id="imgPularIntro" src="media/verdePularIntro.gif" descriptor="dBotao"/>
	
		
			<link xconnector="conn#onBeginStart">
				<bind component="videoAbertura" role="onBegin"/>
				<bind component="imgPularIntro" role="start"/>
			</link>
		
			<link xconnector="conn#onEndStop">
				<bind component="videoAbertura" role="onEnd"/>
				<bind component="imgPularIntro" role="stop"/>
			</link>   
		
			<link xconnector="conn#onKeySelectionStop">
				<bind component="videoAbertura" role="onSelection">
					<bindParam name="aKey" value="GREEN"/>
				</bind>
				<bind component="videoAbertura" role="stop"/>
			</link>
		</context>
		
		<context  id="ctxRevisao">
			<port id="pRevisao" component="video1"/>
			
						
			
			<media id="video1" src="media/ex.mp4" descriptor="dVideo2" />
			<media id="video2" src="media/abertura.mp4" descriptor="dVideo2" />
			<media id="lastQuest" src="media/pergunta.png" descriptor="dFinal" />
			
			<media id="optA" src="media/opcaoA.gif" descriptor="doptA" /> 
			<media id="optB" src="media/opcaoB.gif" descriptor="doptB" /> 
			<media id="optC" src="media/opcaoC.gif" descriptor="doptC" /> 
			<media id="optD" src="media/opcaoD.gif" descriptor="doptD" />
			
			<media id="changes" src="script/counter.lua" descriptor="changesDesc">
				<area id="print" label="pontos"/>
				<property name="add"/>
			</media> 
			
			<media id="finalscore" src="script/counter.lua" descriptor="dfinalscore">
				<area id="printe" label="fim" />
			</media> 
			
			
			<link xconnector="conn#onEndStart">
				<bind component="video1" role="onEnd" />
				<bind role="start" component="changes" interface="print"/>
			</link>
			
			<link xconnector="conn#onEndStart">
				<bind component="lastQuest" role="onEnd" />
				<bind role="start" component="finalscore" interface="printe"/>
			</link>
			
			<!-- menu da aula Q1 --> 
			<link xconnector="conn#onBeginStart_delay">
				<bind component="video1" role="onBegin" />
				<bind component="optA" role="start" >
					<bindParam name="aDelay" value="2s"/>
				</bind>
				<bind component="optB" role="start" >
					<bindParam name="aDelay" value="2s"/>
				</bind>
				<bind component="optC" role="start" >
					<bindParam name="aDelay" value="2s"/>
				</bind>
				<bind component="optD" role="start" >
					<bindParam name="aDelay" value="2s"/>
				</bind>
			</link>  
			
			<link xconnector="conn#onKeySelectionStop">
				<bind component="video1" role="onSelection">
					<bindParam name="aKey" value="RED"/>
				</bind>
				<bind component="optA" role="stop" />
				<bind component="optB" role="stop" />
				<bind component="optC" role="stop" />
				<bind component="optD" role="stop" />
				<bind component="video1" role="stop" />
			</link> 
			
			
			<link xconnector="conn#onKeySelectionStop">
				<bind component="video1" role="onSelection">
					<bindParam name="aKey" value="GREEN"/>
				</bind>
				<bind component="optA" role="stop" />
				<bind component="optB" role="stop" />
				<bind component="optC" role="stop" />
				<bind component="optD" role="stop" />
				<bind component="video1" role="stop" />
			</link>

			<link xconnector="conn#onKeySelectionStop">
				<bind component="video1" role="onSelection">
					<bindParam name="aKey" value="YELLOW"/>
				</bind>
				<bind component="optA" role="stop" />
				<bind component="optB" role="stop" />
				<bind component="optC" role="stop" />
				<bind component="optD" role="stop" />
				<bind component="video1" role="stop" />
			</link>
			
			<link xconnector="conn#onKeySelectionStop">
				<bind component="video1" role="onSelection">
					<bindParam name="aKey" value="BLUE"/>
				</bind>
				<bind component="optA" role="stop" />
				<bind component="optB" role="stop" />
				<bind component="optC" role="stop" />
				<bind component="optD" role="stop" />
				<bind component="video1" role="stop" />
			</link>
			
			<!-- menu da aula Q2 --> 
			
			<link xconnector="conn#onEndStart">
				<bind component="video1" role="onEnd"/>
				<bind component="lastQuest" role="start" />
			</link>
			
			<link xconnector="conn#onBeginStart_delay">
				<bind component="lastQuest" role="onBegin" />
				<bind component="optA" role="start" >
					<bindParam name="aDelay" value="2s"/>
				</bind>
				<bind component="optB" role="start" >
					<bindParam name="aDelay" value="2s"/>
				</bind>
				<bind component="optC" role="start" >
					<bindParam name="aDelay" value="2s"/>
				</bind>
				<bind component="optD" role="start" >
					<bindParam name="aDelay" value="2s"/>
				</bind>
			</link> 
			
			<link xconnector="conn#onKeySelectionStop">
				<bind component="lastQuest" role="onSelection">
					<bindParam name="aKey" value="RED"/>
				</bind>
				<bind component="optA" role="stop" />
				<bind component="optB" role="stop" />
				<bind component="optC" role="stop" />
				<bind component="optD" role="stop" />
				<bind component="lastQuest" role="stop" />
			</link>
			
			
			<link xconnector="conn#onKeySelectionStop">
				<bind component="lastQuest" role="onSelection">
					<bindParam name="aKey" value="GREEN"/>
				</bind>
				<bind component="optA" role="stop" />
				<bind component="optB" role="stop" />
				<bind component="optC" role="stop" />
				<bind component="optD" role="stop" />
				<bind component="lastQuest" role="stop" />
			</link>

			<link xconnector="conn#onKeySelectionStop">
				<bind component="lastQuest" role="onSelection">
					<bindParam name="aKey" value="YELLOW"/>
				</bind>
				<bind component="optA" role="stop" />
				<bind component="optB" role="stop" />
				<bind component="optC" role="stop" />
				<bind component="optD" role="stop" />
				<bind component="lastQuest" role="stop" />
			</link>
			
			<link xconnector="conn#onKeySelectionStop">
				<bind component="lastQuest" role="onSelection">
					<bindParam name="aKey" value="BLUE"/>
				</bind>
				<bind component="optA" role="stop" />
				<bind component="optB" role="stop" />
				<bind component="optC" role="stop" />
				<bind component="optD" role="stop" />
				<bind component="lastQuest" role="stop" />
			</link>
			
		</context>
		
		
		
		<media id="Captura" src="media/captura.png" descriptor="dFinal" />	
		<media id="qrcode" src="media/qrcode.png" descriptor="dVideo2" />

		 <!-- print das respostas -->

		
		<!-- menu selecao -->
	    <context id="menu">
			<port id="pItemA" component="menuItem1"/>
			<port id="pItemB" component="menuItem2"/>
			<port id="pItemC" component="menuItem3"/>
			<port id="pItemD" component="menuItem4"/>

			<media id="menuItem1" src="media/opcaoA.gif" descriptor="dMenuItem1" /> 
			<media id="menuItem2" src="media/opcaoB.gif" descriptor="dMenuItem2" /> 
			<media id="menuItem3" src="media/opcaoC.gif" descriptor="dMenuItem3" /> 
			<media id="menuItem4" src="media/opcaoD.gif" descriptor="dMenuItem4" />
	
		</context>
		

		<!--  aula -->
		<link xconnector="conn#onEndStart">
			<bind component="ctxAula" role="onEnd"/>
			<bind component="Captura" role="start" />
        </link>
		
		<link xconnector="conn#onBeginStart_delay">
			<bind component="Captura" role="onBegin" />
			<bind component="menu" role="start" >
				<bindParam name="aDelay" value="2s"/>
			</bind>
        </link>
		
		<!-- menu  selecao -->
		
		<link xconnector="conn#onKeySelectionStartStop">
			<bind role="onSelection" component="menu" interface="pItemA" />
			<bind role="start" component="ctxAula"/>
			<bind role="stop" component="Captura"/>
		</link>
		
		<link xconnector="conn#onKeySelectionStartStop">
			<bind role="onSelection" component="menu" interface="pItemB" />
			<bind role="start" component="ctxRevisao"/>
			<bind role="stop" component="Captura"/>
		</link>
		
		<link xconnector="conn#onKeySelectionStartStop">
			<bind role="onSelection" component="menu" interface="pItemC" />
			<bind role="start" component="qrcode"/>
			<bind role="stop" component="Captura"/>
		</link>
		
		<link xconnector="onSelectionStop">
			<bind role="onSelection" component="menu" interface="pItemD" />
			<bind role="stop" component="Captura"/>
		</link>
		
		<link xconnector="conn#onEndStop">
			<bind component="Captura" role="onEnd" />
			<bind component="menu" role="stop" />
        </link>
		
	
   </body>
</ncl>
