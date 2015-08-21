conferences = Conference.create([
	{name: "I Love Dogs", image: "dog.jpeg", address: "101 Market Street", city: "San Francisco", state: "California", start_date: "08/17/2015", end_date: "08/18/2015", start_time: "09:00", end_time: "17:00"},
	{name: "Mastercard Hackathon", image: "hackathon.jpg", address: "901 Mission Street", city: "San Francisco", state: "California", start_date: "08/22/2015", end_date: "08/23/2015", start_time: "09:00", end_time: "18:00"},
	{name: "Google Chrome Dev Summit", image: "google2.jpg", address: "468 Ellis Street", city: "San Francisco", state: "California", start_date: "11/17/2015", end_date: "11/18/2015", start_time: "10:00", end_time: "16:00"},
	{name: "Comic Con San Diego", image: "comiccon2.jpg", address: "4716 Palm Ave", city: "La Mesa", state: "California", start_date: "06/15/2016", end_date: "06/21/2016", start_time: "06:00", end_time: "20:00"}
])

categories = Category.create([
	{name: "Food & Drink", image: "fooddrink.png"},
	{name: "Arts & Music", image: "artculture.png"},
	{name: "Family Friendly", image: "family.png"},
	{name: "Sports & Fitness", image: "fitness.jpg"},
	{name: "Networking", image: "networking.png"}
])