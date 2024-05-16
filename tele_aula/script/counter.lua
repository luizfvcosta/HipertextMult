local counter = 0
local pont = 0
local dx, dy = canvas:attrSize() -- dimensoes do canvas

function handler1 (evt)
   if evt.class=='ncl' and evt.type=='attribution' and evt.action=='start' and evt.name=='add' then 
      counter = counter + evt.value

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
   if evt.class=='ncl' and evt.type=='presentation' and evt.action=='start' and evt.label=='pontos' then 
	  canvas:attrColor ('black')
	  canvas:drawRect('fill',0,0,dx,dy)
	  canvas:attrColor ('red')
	  canvas:attrFont ('vera', 10, 'bold')
	  canvas:drawText (1,1, tostring(pont)..' / '..counter)
	
	  canvas:flush()
 
	  event.post {
		 class = 'ncl',
		 type = 'presentation',
		 label = 'pontos',
		 action = 'stop',
	  }
   end

	
	
end

function handler3 (evt)
   if evt.class=='ncl' and evt.type=='presentation' and evt.action=='start' and evt.label=='fim' then 
      canvas:attrColor ('black')
      canvas:drawRect('fill',0,0,dx,dy)
      canvas:attrColor ('yellow')
      canvas:attrFont ('vera', 24, 'bold')
      canvas:drawText (10,10, 'Sua Pontuação final foi: '..tostring(pont)..' / '..counter)
      canvas:flush()

      event.post {
         class   = 'ncl',
         type    = 'presentation',
         label   = 'fim',
         action  = 'stop',
      }
   end
end

event.register(handler1)
event.register(handler2,'ncl','presentation','pontos','start')
event.register(handler3,'ncl','presentation','fim','start')
