# Lotus Sidejob Pack
Ox compatible side job package for Fivem

# Important !!
The scripts in this package were **adapted from the** [xd-karpuz](https://github.com/orcunxd/xd-karpuz) script.
<br><br>
The script **does not contain sales**, so you can set up your sales by installing [lation-pawnshop](https://github.com/IamLation/lation_pawnshop)

# Contents
**Banana**<br>
**Tomato**<br>
**Watermelon**<br>
**Orange**<br>
**Wine**<br>

# Installation
Copy all the items and paste them into **ox_inventory/data/items.lua**

    ['grape'] = {
		label = 'Üzüm',
		weight = 1,
		stack = true,
		close = true
	},
	['wine'] = {
		label = 'Wine',
		weight = 1,
		stack = true,
		close = true
	},
	['orange'] = {
		label = 'Portakal',
		weight = 1,
		stack = true,
		close = true
	},
	['orangejucie'] = {
		label = 'Orange Jucie',
		weight = 1,
		stack = true,
		close = true
	},
	['watermelon'] = {
		label = 'Watermelon',
		weight = 1,
		stack = true,
		close = true
	},
	['watermelonjuice'] = {
		label = 'Watermelon Juice',
		weight = 1,
		stack = true,
		close = true
	},
	['tomato'] = {
		label = 'Tomato',
		weight = 1,
		stack = true,
		close = true
	},
	['packagedtomatoes'] = {
		label = 'Packaged Tomatoes',
		weight = 1,
		stack = true,
		close = true
	},
	['banana'] = {
		label = 'Banana',
		weight = 1,
		stack = true,
		close = true
	},
	['packagedbanana'] = {
		label = 'Processed Banana',
		weight = 1,
		stack = true,
		close = true
	},'

# Add images
Copy all the photos in the [images] folder and paste them into **ox_inventory/web/images** and you can restart the server and use them.

# Starting Resources
Drop all the resources in your resorces folder and paste this code to server.cfg

	ensure banana
  	ensure orange
  	ensure tomato
  	ensure watermelon
  	ensure wine
