<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="quiz" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">

<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 !  CABEÇALHO DO PROGRAMA
 !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

   <head>
      <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       !  BASE DE REGIÕES:
       !  define as regiões na tela onde as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

      <regionBase>
		<region id="backgroundReg" width="100%" height="100%" zIndex="50" >
			<region id="rgVideo" width="100%" height="100%"  zIndex="51" />
			<region id="rgResult" width="100%" height="100%" zIndex="55" />
			<region id="rgBotao" right="5%" bottom="%" width="200" height="45" zIndex="52"/>
			<region id="rgQcode" right="5%" bottom="1%" width="200" height="200" zIndex="56"/>
		</region>
		<region id="rgMenu" width="100%"   zIndex="1"> 
			<region id="rgMenuReptir"  left="10%"  width="63%"  top="21%" height="15%" zIndex="55" /> 
			<region id="rgMenuRevisao" left="10%"  width="63%"  top="40%" height="15%" zIndex="55" /> 
			<region id="rgMenuCompra"  left="10%"  width="63%"  top="59%" height="15%" zIndex="55" /> 
			<region id="rgMenuSair"    left="10%"  width="63%"  top="79%" height="15%" zIndex="55" /> 
			<region id="rgMenuItem1" left="13.6%"  width="39.4%"  top="28.8%" height="16%" zIndex="55" /> 
			<region id="rgMenuItem2" left="13.6%"  width="39.4%"  top="46%" height="16%" zIndex="55" /> 
			<region id="rgMenuItem3" left="13.6%"  width="39.4%"  top="63%" height="16%" zIndex="55" /> 
			<region id="rgMenuItem4" left="13.6%"  width="39.4%"  top="80%" height="16%" zIndex="55" /> 
		</region>
		
      </regionBase>

      <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
       !  BASE DE DESCRITORES:
       !  define como as mídias são apresentadas
       !++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

      <descriptorBase>
		<descriptor id="dResult" region="rgResult"  />
		<descriptor id="dcaptura" region="rgVideo"  />
		<descriptor id="dvode" region="rgQcode" explicitDur="5s"/>
		<descriptor id="dBotao" region="rgBotao" explicitDur="3s"/>
        <descriptor id="dVideo" region="rgVideo" explicitDur="186s"/>
		<descriptor id="dVideoAula" region="rgVideo" explicitDur="290s"/>
		
		<descriptor id="dMenuReptir"  region="rgMenuReptir" focusIndex="1" moveUp="4" moveDown="2" />
        <descriptor id="dMenuRevisao" region="rgMenuRevisao" focusIndex="2" moveUp="1" moveDown="3" />
        <descriptor id="dMenuCompra"  region="rgMenuCompra" focusIndex="3" moveUp="2" moveDown="4" />
        <descriptor id="dMenuSair"    region="rgMenuSair" focusIndex="4" moveUp="3" moveDown="1" />
		
		<descriptor id="dMenuItem1" region="rgMenuItem1" focusIndex="1" moveUp="4" moveDown="2" />
        <descriptor id="dMenuItem2" region="rgMenuItem2" focusIndex="2" moveUp="1" moveDown="3" />
        <descriptor id="dMenuItem3" region="rgMenuItem3" focusIndex="3" moveUp="2" moveDown="4" />
        <descriptor id="dMenuItem4" region="rgMenuItem4" focusIndex="4" moveUp="3" moveDown="1" />
		
      </descriptorBase>
	  
	  <connectorBase>
		<importBase  alias="conn"  documentURI="connBaseAula.ncl" />
		
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
		
	
		<port id="pe" component="ctxAula" />
		<port id="pNCLua" component="clicks"/> 
		
		<context  id="ctxAula">
			<port id="pVideoAbertura" component="videoAbertura"/>

			<media id="videoAbertura" src="media/video_raiz.mp4" descriptor="dVideoAula" />
			<media id="imgPularIntro" src="media/verdePularAula.gif" descriptor="dBotao"/>
			
			
		
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
		
		<media id="acao" src="media/acao.png" descriptor="dcaptura" >
			<area id="escolha" begin="1s" end="15s"/>
		</media>
		<media id="menuReptir" src="media/op_repitir.gif" descriptor="dMenuReptir" />
		<media id="menuRevisao" src="media/op_revisao.gif" descriptor="dMenuRevisao" /> 
		<media id="menuCompra" src="media/op_compra.gif" descriptor="dMenuCompra" /> 
		<media id="menuSair" src="media/op_sair.gif" descriptor="dMenuSair" />
		
		<media id="qrcode" src="media/qrcode.png" descriptor="dvode" />
		
		<media id="clicks" src="clicks.lua" descriptor="dResult" >
				<area id="print" label="fim"/>
			<!-- counter variable -->
				<property name="add"/>
				<area id="printe" label="pontos"/>
		</media>
		
		
		<media id="videoQuiz" src="media/quiz_raiz.mp4" descriptor="dVideo" >
				<area id="area01" begin="1s" end="14s"/>
				<area id="area02" begin="19s" end="33s"/>
				<area id="area03" begin="37s" end="50s"/>
				<area id="area04" begin="54s" end="69s"/>
				<area id="area05" begin="73s" end="87s"/>
				<area id="area06" begin="92s" end="106.5s"/>
				<area id="area07" begin="111s" end="125s"/>
				<area id="area08" begin="130s" end="145s"/>
				<area id="area09" begin="150s" end="164s"/>
				<area id="area10" begin="170s" end="183s"/>
		</media> 		
		
		<context id="menu"> 
			<port id="pMenuItem1" component="menuItem1" /> 
			<port id="pMenuItem2" component="menuItem2" /> 
			<port id="pMenuItem3" component="menuItem3" /> 
			<port id="pMenuItem4" component="menuItem4" /> 
			
			<media id="menuItem1" descriptor="dMenuItem1" />
			<media id="menuItem2" descriptor="dMenuItem2" /> 
			<media id="menuItem3" descriptor="dMenuItem3" /> 
			<media id="menuItem4" descriptor="dMenuItem4" />
		</context>
		
		<!-- seleção da opção no pos aula -->
		
		<link xconnector="conn#onEndStart">
				<bind role="onEnd" component="ctxAula" />
				<bind component="acao" role="start"/>
				<bind component="menuReptir"  role="start"/>
				<bind component="menuRevisao" role="start"/>
				<bind component="menuCompra" role="start"/>
				<bind component="menuSair" role="start"/>
		</link>
		
		<link  xconnector="conn#onSelectionStartStop">
				<bind component="menuReptir"  role="onSelection" /> 
				<bind role="start" component="ctxAula"/>
				<bind component="acao" role="stop"/>
				<bind component="menuReptir"  role="stop"/>
				<bind component="menuRevisao" role="stop"/>
				<bind component="menuCompra" role="stop"/>
				<bind component="menuSair" role="stop"/>
		</link>
		
		<link  xconnector="conn#onSelectionStartStop">
				<bind component="menuRevisao"  role="onSelection" /> 
				<bind role="start" component="videoQuiz"/>
				<bind component="acao" role="stop"/>
				<bind component="menuReptir"  role="stop"/>
				<bind component="menuRevisao" role="stop"/>
				<bind component="menuCompra" role="stop"/>
				<bind component="menuSair" role="stop"/>
		</link>
		
		<link  xconnector="conn#onSelectionStartStop">
				<bind component="menuCompra"  role="onSelection" /> 
				<bind role="start" component="qrcode"/>
				<bind component="menuCompra" role="stop"/>
		</link>
		
		<link  xconnector="conn#onEndStart">
				<bind role="onEnd" component="qrcode"/>
				<bind role="start" component="menuCompra"/>
		</link>
		
		<link  xconnector="conn#onSelectionStop">
				<bind component="menuSair"  role="onSelection" /> 
				<bind component="acao" role="stop"/>
				<bind component="menuReptir"  role="stop"/>
				<bind component="menuRevisao" role="stop"/>
				<bind component="menuCompra" role="stop"/>
				<bind component="menuSair" role="stop"/>
				<bind component="clicks" role="stop"/>
		</link>
		
		<link  xconnector="conn#onEndStopStart">
				<bind role="onEnd" component="acao" interface="escolha" />
				<bind component="acao" role="stop"/>
				<bind component="menuReptir"  role="stop"/>
				<bind component="menuRevisao" role="stop"/>
				<bind component="menuCompra" role="stop"/>
				<bind component="menuSair" role="stop"/>
				<bind component="clicks" role="stop"/>
				<bind role="start" component="ctxAula" />
		</link>
		
		<!-- parte interativa quiz -->
		
		<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="videoQuiz" interface="area01" />
				<bind role="start" component="menu"/>
		</link>
		
		<link  xconnector="conn#onSelectionStopSet">
				<bind component="menu" interface="pMenuItem1" role="onSelection" /> 
				<bind role="set" component="clicks" interface="add">
					<bindParam name="var" value="1"/>
				</bind>
				<bind role="stop" component="menu"/>
		</link>
		
		<link  xconnector="conn#onSelectionStopSet">
				<bind component="menu" interface="pMenuItem2" role="onSelection" /> 
				<bind role="set" component="clicks" interface="add">
					<bindParam name="var" value="2"/>
				</bind>
				<bind role="stop" component="menu"/>
		</link>
		
		<link  xconnector="conn#onSelectionStopSet">
				<bind component="menu" interface="pMenuItem3" role="onSelection" /> 
				<bind role="set" component="clicks" interface="add">
					<bindParam name="var" value="3"/>
				</bind>
				<bind role="stop" component="menu"/>
		</link>
		
		<link  xconnector="conn#onSelectionStopSet">
				<bind component="menu" interface="pMenuItem4" role="onSelection" /> 
				<bind role="set" component="clicks" interface="add">
					<bindParam name="var" value="4"/>
				</bind>
				<bind role="stop" component="menu"/>
		</link>

		<link  xconnector="conn#onEndStopStart_delay">
				<bind role="onEnd" component="videoQuiz" interface="area01" />
				<bind role="stop" component="menu"/>
				<bind role="start" component="clicks" interface="print" >
					<bindParam name="aDelay" value="1s"/>
				</bind>
		</link>
		
		<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="videoQuiz" interface="area02" />
				<bind role="start" component="menu"/>
		</link>
		
		<link  xconnector="conn#onEndStopStart_delay">
				<bind role="onEnd" component="videoQuiz" interface="area02" />
				<bind role="stop" component="menu"/>
				<bind role="start" component="clicks" interface="print" >
					<bindParam name="aDelay" value="1s"/>
				</bind>
		</link>
		
		<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="videoQuiz" interface="area03" />
				<bind role="start" component="menu"/>
		</link>
		
		<link  xconnector="conn#onEndStopStart_delay">
				<bind role="onEnd" component="videoQuiz" interface="area03" />
				<bind role="stop" component="menu"/>
				<bind role="start" component="clicks" interface="print" >
					<bindParam name="aDelay" value="1s"/>
				</bind>
		</link>
		

		<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="videoQuiz" interface="area04" />
				<bind role="start" component="menu"/>
		</link>
		
		<link  xconnector="conn#onEndStopStart_delay">
				<bind role="onEnd" component="videoQuiz" interface="area04" />
				<bind role="stop" component="menu"/>
				<bind role="start" component="clicks" interface="print" >
					<bindParam name="aDelay" value="1s"/>
				</bind>
		</link>
		
		<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="videoQuiz" interface="area05" />
				<bind role="start" component="menu"/>
		</link>
		
		<link  xconnector="conn#onEndStopStart_delay">
				<bind role="onEnd" component="videoQuiz" interface="area05" />
				<bind role="stop" component="menu"/>
				<bind role="start" component="clicks" interface="print" >
					<bindParam name="aDelay" value="1s"/>
				</bind>
		</link>
		
		<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="videoQuiz" interface="area06" />
				<bind role="start" component="menu"/>
		</link>
		
		<link  xconnector="conn#onEndStopStart_delay">
				<bind role="onEnd" component="videoQuiz" interface="area06" />
				<bind role="stop" component="menu"/>
				<bind role="start" component="clicks" interface="print" >
					<bindParam name="aDelay" value="1s"/>
				</bind>
		</link>
		
		<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="videoQuiz" interface="area07" />
				<bind role="start" component="menu"/>
		</link>
		
		<link  xconnector="conn#onEndStopStart_delay">
				<bind role="onEnd" component="videoQuiz" interface="area07" />
				<bind role="stop" component="menu"/>
				<bind role="start" component="clicks" interface="print" >
					<bindParam name="aDelay" value="1s"/>
				</bind>
		</link>
		
		<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="videoQuiz" interface="area08" />
				<bind role="start" component="menu"/>
		</link>
		
		<link  xconnector="conn#onEndStopStart_delay">
				<bind role="onEnd" component="videoQuiz" interface="area08" />
				<bind role="stop" component="menu"/>
				<bind role="start" component="clicks" interface="print" >
					<bindParam name="aDelay" value="1s"/>
				</bind>
		</link>

		<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="videoQuiz" interface="area09" />
				<bind role="start" component="menu"/>
		</link>
		
		<link  xconnector="conn#onEndStopStart_delay">
				<bind role="onEnd" component="videoQuiz" interface="area09" />
				<bind role="stop" component="menu"/>
				<bind role="start" component="clicks" interface="print" >
					<bindParam name="aDelay" value="1s"/>
				</bind>
		</link>
		
		<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="videoQuiz" interface="area10" />
				<bind role="start" component="menu"/>
		</link>
		
		<link  xconnector="conn#onEndStop">
				<bind role="onEnd" component="videoQuiz" interface="area10" />
				<bind role="stop" component="menu"/>
		</link>
		
		
		<link xconnector="conn#onEndStart">
				<bind role="onEnd" component="videoQuiz" />
				<bind role="start" component="clicks" interface="printe" />
		</link>
		
		<link xconnector="conn#onBeginstop_delay">
				<bind role="onBegin" component="clicks" interface="printe" />
				<bind role="stop" component="clicks" >
					<bindParam name="aDelay" value="3s"/>
				</bind>
		</link>
		
		<!--
		<link xconnector="onBeginStop_delayStart">
			<bind role="onBegin" component="clicks" interface="printe" />
			<bind role="stop" component="clicks" >
					<bindParam name="aDelay" value="3s"/>
			</bind>
			<bind component="acao" role="start" >
					<bindParam name="aDelay" value="3s"/>
			</bind>
		</link>
		-->
		
   </body>
</ncl>
