#Scroll a long message up
#by Kay Savetz, Dec 12 2021

load("render.star", "render")

def main(config):

	message=getmessage()
	
	scroll=[]
	frames=[]
	lines = message.split("\n")

	#make the message a long list of spaced padding widgets containing text widgets
	for i in range(len(lines)):
		leftpad=center(lines[i])
		scroll.append(
			render.Padding(
				pad=(leftpad,i*8,0,0),
				child=render.Text(
					content = lines[i],
				),
			),
		)

	#put those widgets in a stack, and render frames of it scrolling up
	for i in range(32,-(len(lines)*8),-1):	
		frames.append(
			render.Animation(
				children=[
					render.Padding(
						pad=(0,i,0,0),
						child=render.Stack(
							children=scroll
						),
					)
				],
			),
		)
	
	print(str(len(frames)) + " frames")
	
	return render.Root(
	delay = 5,
	child = render.Animation(
		children=frames,
	)
)   

def center(text):
	x = 32-(int(len(text)/2*5))
	if x<0:
		x=0
	return x

def getmessage():
	return """
No sun—
no moon!
No morn—
no noon—
No dawn—
No sky—
no earthly
view
No distance
looking blue—
No road—
no street—
no "t'other
side the way"
No end
to any Row—
No indications
where the
Crescents go—
No top to any
steeple—
No recognitions
of familiar
people—
No courtesies
for showing
'em
No knowing 'em!
No traveling
at all-
no locomotion,
No inkling of
the way—
no notion—
"No go"-
by land
or ocean—
No mail—
no post—
No news from
any foreign 
coast—
No park—
no ring
no afternoon
gentility—
No company—
no nobility—
No warmth,
no
cheerfulness,
no healthful
ease,
No
comfortable
feel
in any member—
No shade,
no shine,
no
butterflies,
no bees,
No fruits,
no flowers,
no leaves,
no birds,
November!
  
  
"""