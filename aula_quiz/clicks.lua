local counter = 1
local pontos = 0
local Meta = 7
local respostas = {'1','3','1','2','1','2','3','2','3','2'}
local img_parab = canvas:new("media/parabens.jpg")
local img_inc = canvas:new("media/incentivo.png")
local dx, dy = canvas:attrSize()
function handler1 (evt)
   if evt.class=='ncl' and evt.type=='attribution' and evt.action=='start' and evt.name=='add' then 
   
	  if evt.value == respostas[counter] then
		pontos = pontos + 1		
	  end
	  
      event.post {
         class   = 'ncl',
         type    = 'attribution',
         name    = 'add',
         action  = 'stop',
         value   = counter,
      }
   end
end

function handler2 (evt)
   if evt.class=='ncl' and evt.type=='presentation' and evt.action=='start' and evt.label=='fim' then 
      --canvas:attrColor ('yellow')
	  --canvas:drawRect('fill',0,0,dx,dy)
	  canvas:attrColor (0, 0, 0, 0)
	  canvas:clear ()
	  
	  canvas:attrColor ('red')
	  canvas:attrFont ('vera', 20, 'bold')
	  canvas:drawText (560, 560 , 'Pontuação: '..pontos..' / '..counter)
      canvas:flush()
	  
	  
	  counter = counter + 1 

      event.post {
         class   = 'ncl',
         type    = 'presentation',
         label   = 'fim',
         action  = 'stop',
      }
   end
end

function handler3 (evt)
   if evt.class=='ncl' and evt.type=='presentation' and evt.action=='start' and evt.label=='pontos' then 
	  canvas:attrColor (0, 0, 0, 0)
	  canvas:clear ()
	  
	  --canvas:attrColor ('yellow')
	  --canvas:attrFont ('vera', 40, 'bold')
	  
	  if pontos >= Meta then 
		canvas:compose(150, 160, img_parab)
		canvas:attrColor ('yellow')
		canvas:attrFont ('vera', 35, 'bold')
		canvas:drawText (50, 30, '\t \t Parabéns !!! \n Sua Pontuação final foi: '..pontos..' de '..counter)
	  else
		canvas:compose(150, 160, img_inc)
	  	canvas:attrColor ('yellow')
		canvas:attrFont ('vera', 35, 'bold')
		canvas:drawText (50, 30, '\t Melhore seus estudos \n Sua Pontuação final foi: '..pontos..' de '..counter)
	  end
	  
	  canvas:flush()
	  
      event.post {
         class   = 'ncl',
         type    = 'presentation',
         label   = 'pontos',
         action  = 'stop',
      }
   end
end


event.register(handler1)
event.register(handler2)
event.register(handler3)
