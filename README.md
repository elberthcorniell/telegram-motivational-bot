
![](https://img.shields.io/badge/Microverse-blueviolet)


# Telegram Motivational Bot

A Telegram bot to send motivational quotes everyday or whenever you need one


## About the Project

This project implements Telegram bot using Ruby and the help of some gems like:

- telegram-bot-ruby
- json
- net-http-persistent

## Live Demo

 [Telegram bot]()

## Built With

- Ruby
- Visual Studio, Git & GitHub

## About Tic-tac-toe

Tic-tac-toe is a game for two players, "X" and "O", who take turns marking the spaces in a 3×3 grid.

The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner.

## Getting Started

### Prerequisites

- Ruby
- A terminal
- Telegram bot API key

#### How to get a Telegram API key

- Register on Telegram.
- Search for Bot father.
- Type ```/new bot``` in the chat and follow the instructions.

### Setup

- Clone or download this repository
- If necessary, unzip the downloaded directory
- Replace the "Telegram_Bot_API" value in lib/config.json with your API key.
    ```
        {
            "telegram_bot_api": "YOUR API KEY HERE"
        }
    ```
- Run:
    ```
        bundle install
    ```

### Usage

- Go into the "tic-tac-toe" directory
- Execute the "main.rb" file

```
./bin/main.rb
```

- Follow the "How to play" instructions

## How to Play

1. The first player (Player 1) will choose their symbol "X" or "O". The remaining symbol will be assigned to the other player (Player 2);
2. Enter Player 1's name;
3. Enter Player 2's name;
4. Starting with Player 1, turn after turn, each player will type a number (1 to 9) corresponding to their desired movement;
5. The players continue making movements until one of them get three of their marks in a horizontal, vertical, or diagonal row;
6. If no player gets three of their marks in a row after all the board's spots are marked, the game ends in a draw.


### Testing methods

![Screenshot of testing](capture.png)

For testing please escute the next steps:

- Execute the following code on the terminal to get the Gems needed:

```
bundle install
```

- Run the test with the following command:

```
rspec
```

## Authors

👨‍💻 **Elbert Corniell**

- GitHub: [@elberthcorniell](https://github.com/elberthcorniell)
- Twitter: [@elberthcorniell](https://twitter.com/elberthcorniell)
- LinkedIn: [Elbert Corniell](https://www.linkedin.com/in/elbert-corniell-989183159/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/elberthcorniell/telegram-motivational-bot/issues).


## Thank's to

- [Free motivational quotes API](https://forum.freecodecamp.org/t/free-api-inspirational-quotes-json-with-code-examples/311373)


## Show your support

Give a ⭐️ if you like this project!


## 📝 License

This project is [MIT](./LICENSE) licensed.