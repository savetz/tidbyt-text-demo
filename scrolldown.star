#Scroll a line of text down
#by Kay Savetz, Dec 12 2021

load("render.star", "render")

def main(config):

	frames=[]
	
	message="Peace"
	leftpad=center(message)
	for i in range(-8,38):
		frames.append(	
			render.Padding(
				pad=(leftpad,i,0,0),
				child=render.Text(
					content = message,
				)
			),				
		)
	
	return render.Root(
	delay = 5,
	child = render.Animation(
		children=frames,
	)
)   

def center(text):
	return 32-(int(len(text)/2*5))
