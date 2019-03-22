#IN DEVELOPMENT 
## RPG Group Tracker

**What's Completed?**
- The model for DnD5e characters are modeled in the DB.Turns out there are  a lot of Many to Many Relationships in DnD5e, and likely other games (which I may attempt to model out later).
- The RPG Group model is mostly ready, though I am sure my design is lacking and will need changed down the line (particularly for handling User Authentication or Roles)
- Some of the models in the MVC application are ready to go as representations of tables, at least for their properties. Methods operating on them may be needed later.

**What's Left?**
- Frankly, a majority of the project.
- Views (both with the HTML and Razor code)
- Controllers
- The ReactJS Front-End  I want to put together to attempt to emulate the workspace of programs like Roll20 or Fantasy Grounds




**Description**

Managing an RPG game can be a challenge. Organizing people together for a game, knowing your abilities, even managing character sheets. This application allows players to organize into groups, designate a GM, alert the group of notifications and schedules, track their characters across multiple games, and look up references to their abilities and items.

**Users**

1. Administrators
2. Players
    - GMs (a player with extra rights to see and edit other players characters)



**User Stories**
1. As a player, I want to be able to setup a new and invite other people to join the application to join the game. (automatically setting that initial player as the GM)

2. As a player, I want to be able to make multiples characters per game and see all my characters across all games I have played.

3. As a player, I want to be able to see everything each character has: items, abilities, stats, backgrounds

4. As a player I want to be able to set a picture for my character

5. As a GM I want to be able to set another player to GM (to switch or Co-GM)

6. As a GM, I want to be able to add/remove items/abilities to any player in my game.

7. As a player, I want to be able to add/Remove items/abilities on my characters. 

8. As a player, I want to be able to edit certain fields like money amounts, biography, and notes.

9. As an administrator,  I want to be able to query any game on the app and delete.

10. As an administrator, I want to be able to do anything a player or GM can

