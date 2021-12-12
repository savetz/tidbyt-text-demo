#Drop shadow demo
#by Kay Savetz, Dec 12 2021

load("render.star", "render")
load("time.star", "time")

def main(config):

	timezone = config.get("timezone") or "America/Los_Angeles"
	now = time.now().in_location(timezone)
	message= now.format("3:04 PM")

	return render.Root(
		child = render.Stack(
			children=[
				#Style 1				
				render.Padding(
					#this is the shadow, behind
					pad=(16,5,0,0),
					child=render.Text(
						color = "#666",
						content = message,
					)
				),				

				render.Padding(
					#this is the main text
					pad=(17,6,0,0),
					child=render.Text(
						content = message,
					)
				),				


				#Style 2
				render.Padding(
					#this is the shadow, behind
					pad=(16,16,0,0),
					child=render.Text(
						color = "#666",
						content = message,
					)
				),				

				render.Padding(
					#this is the main text
					pad=(17,16,0,0),
					child=render.Text(
						content = message,
					)
				),				

			],
		)
	)