# Unit-Testing-Lab
Pursuit-Core-iOS-Introduction-to-Unit-Testing-Lab

Organizing Structure

Create a Tab Bar Controller.
Each Tab in the Tab Bar Controller should be a Navigation Controller
The Navigation Controller should have a View Controller with a Table View as its Root View Controller
Selecting a cell in the Table View should segue to a Detail View Controller with additional information.
Parsing Data

Below are the endpoints to hit. For each endpoint, select a search query and copy and paste the JSON into Xcode. Make a new file called customname.json and save it at the top level of your project. For each JSON file, create a model that conforms to Codable, then build your Table View and associated Detail View Controller.
Add unit tests for each of the models that you build

Endpoint One

Official Joke API

Show a list of all of the setups. Select a setup to see the punchline.

Endpoint Two

Star Wars API - films

Show a list of all the movies. Selecting a movie should display the opening crawl.

BONUS: Make the crawl have the same text effect as in the movies.

Endpoint Three

Trivia API

Display a list of questions. Selecting a question should bring you to a detailVC where you can see the options. Selecting the correct answer should make the background turn green and disable selecting any further options. Selecting an incorrect answer should turn the background red and disable selecting any further options.

Use the removingPercentEncoding property on a String to make the text readable

BONUS: Track the user's score and don't allow them to answer questions they've already answered.
