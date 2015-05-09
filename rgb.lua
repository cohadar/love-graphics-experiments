-------------------------------------------------------------------------------
--- @module rgb
--- Generated from: http://xkcd.com/color/rgb.txt
--- Read this: http://blog.xkcd.com/2010/05/03/color-survey-results/
-------------------------------------------------------------------------------
local rgb = {}

-------------------------------------------------------------------------------
local function load( color, name )
  local r = tonumber( "0x" .. string.sub( color, 1, 2 ) )
  local g = tonumber( "0x" .. string.sub( color, 3, 4 ) )
  local b = tonumber( "0x" .. string.sub( color, 5, 6 ) )
  rgb[ name ] = { r = r, g = g, b = b }
end

-------------------------------------------------------------------------------
load( "ACC2D9", "cloudy blue" )
load( "56AE57", "dark pastel green" )
load( "B2996E", "dust" )
load( "A8FF04", "electric lime" )
load( "69D84F", "fresh green" )
load( "894585", "light eggplant" )
load( "70B23F", "nasty green" )
load( "D4FFFF", "really light blue" )
load( "65AB7C", "tea" )
load( "952E8F", "warm purple" )
load( "FCFC81", "yellowish tan" )
load( "A5A391", "cement" )
load( "388004", "dark grass green" )
load( "4C9085", "dusty teal" )
load( "5E9B8A", "grey teal" )
load( "EFB435", "macaroni and cheese" )
load( "D99B82", "pinkish tan" )
load( "0A5F38", "spruce" )
load( "0C06F7", "strong blue" )
load( "61DE2A", "toxic green" )
load( "3778BF", "windows blue" )
load( "2242C7", "blue blue" )
load( "533CC6", "blue with a hint of purple" )
load( "9BB53C", "booger" )
load( "05FFA6", "bright sea green" )
load( "1F6357", "dark green blue" )
load( "017374", "deep turquoise" )
load( "0CB577", "green teal" )
load( "FF0789", "strong pink" )
load( "AFA88B", "bland" )
load( "08787F", "deep aqua" )
load( "DD85D7", "lavender pink" )
load( "A6C875", "light moss green" )
load( "A7FFB5", "light seafoam green" )
load( "C2B709", "olive yellow" )
load( "E78EA5", "pig pink" )
load( "966EBD", "deep lilac" )
load( "CCAD60", "desert" )
load( "AC86A8", "dusty lavender" )
load( "947E94", "purpley grey" )
load( "983FB2", "purply" )
load( "FF63E9", "candy pink" )
load( "B2FBA5", "light pastel green" )
load( "63B365", "boring green" )
load( "8EE53F", "kiwi green" )
load( "B7E1A1", "light grey green" )
load( "FF6F52", "orange pink" )
load( "BDF8A3", "tea green" )
load( "D3B683", "very light brown" )
load( "FFFCC4", "egg shell" )
load( "430541", "eggplant purple" )
load( "FFB2D0", "powder pink" )
load( "997570", "reddish grey" )
load( "AD900D", "baby shit brown" )
load( "C48EFD", "liliac" )
load( "507B9C", "stormy blue" )
load( "7D7103", "ugly brown" )
load( "FFFD78", "custard" )
load( "DA467D", "darkish pink" )
load( "410200", "deep brown" )
load( "C9D179", "greenish beige" )
load( "FFFA86", "manilla" )
load( "5684AE", "off blue" )
load( "6B7C85", "battleship grey" )
load( "6F6C0A", "browny green" )
load( "7E4071", "bruise" )
load( "009337", "kelley green" )
load( "D0E429", "sickly yellow" )
load( "FFF917", "sunny yellow" )
load( "1D5DEC", "azul" )
load( "054907", "darkgreen" )
load( "B5CE08", "green/yellow" )
load( "8FB67B", "lichen" )
load( "C8FFB0", "light light green" )
load( "FDDE6C", "pale gold" )
load( "FFDF22", "sun yellow" )
load( "A9BE70", "tan green" )
load( "6832E3", "burple" )
load( "FDB147", "butterscotch" )
load( "C7AC7D", "toupe" )
load( "FFF39A", "dark cream" )
load( "850E04", "indian red" )
load( "EFC0FE", "light lavendar" )
load( "40FD14", "poison green" )
load( "B6C406", "baby puke green" )
load( "9DFF00", "bright yellow green" )
load( "3C4142", "charcoal grey" )
load( "F2AB15", "squash" )
load( "AC4F06", "cinnamon" )
load( "C4FE82", "light pea green" )
load( "2CFA1F", "radioactive green" )
load( "9A6200", "raw sienna" )
load( "CA9BF7", "baby purple" )
load( "875F42", "cocoa" )
load( "3A2EFE", "light royal blue" )
load( "FD8D49", "orangeish" )
load( "8B3103", "rust brown" )
load( "CBA560", "sand brown" )
load( "698339", "swamp" )
load( "0CDC73", "tealish green" )
load( "B75203", "burnt siena" )
load( "7F8F4E", "camo" )
load( "26538D", "dusk blue" )
load( "63A950", "fern" )
load( "C87F89", "old rose" )
load( "B1FC99", "pale light green" )
load( "FF9A8A", "peachy pink" )
load( "F6688E", "rosy pink" )
load( "76FDA8", "light bluish green" )
load( "53FE5C", "light bright green" )
load( "4EFD54", "light neon green" )
load( "A0FEBF", "light seafoam" )
load( "7BF2DA", "tiffany blue" )
load( "BCF5A6", "washed out green" )
load( "CA6B02", "browny orange" )
load( "107AB0", "nice blue" )
load( "2138AB", "sapphire" )
load( "719F91", "greyish teal" )
load( "FDB915", "orangey yellow" )
load( "FEFCAF", "parchment" )
load( "FCF679", "straw" )
load( "1D0200", "very dark brown" )
load( "CB6843", "terracota" )
load( "31668A", "ugly blue" )
load( "247AFD", "clear blue" )
load( "FFFFB6", "creme" )
load( "90FDA9", "foam green" )
load( "86A17D", "grey/green" )
load( "FDDC5C", "light gold" )
load( "78D1B6", "seafoam blue" )
load( "13BBAF", "topaz" )
load( "FB5FFC", "violet pink" )
load( "20F986", "wintergreen" )
load( "FFE36E", "yellow tan" )
load( "9D0759", "dark fuchsia" )
load( "3A18B1", "indigo blue" )
load( "C2FF89", "light yellowish green" )
load( "D767AD", "pale magenta" )
load( "720058", "rich purple" )
load( "FFDA03", "sunflower yellow" )
load( "01C08D", "green/blue" )
load( "AC7434", "leather" )
load( "014600", "racing green" )
load( "9900FA", "vivid purple" )
load( "02066F", "dark royal blue" )
load( "8E7618", "hazel" )
load( "D1768F", "muted pink" )
load( "96B403", "booger green" )
load( "FDFF63", "canary" )
load( "95A3A6", "cool grey" )
load( "7F684E", "dark taupe" )
load( "751973", "darkish purple" )
load( "089404", "true green" )
load( "FF6163", "coral pink" )
load( "598556", "dark sage" )
load( "214761", "dark slate blue" )
load( "3C73A8", "flat blue" )
load( "BA9E88", "mushroom" )
load( "021BF9", "rich blue" )
load( "734A65", "dirty purple" )
load( "23C48B", "greenblue" )
load( "8FAE22", "icky green" )
load( "E6F2A2", "light khaki" )
load( "4B57DB", "warm blue" )
load( "D90166", "dark hot pink" )
load( "015482", "deep sea blue" )
load( "9D0216", "carmine" )
load( "728F02", "dark yellow green" )
load( "FFE5AD", "pale peach" )
load( "4E0550", "plum purple" )
load( "F9BC08", "golden rod" )
load( "FF073A", "neon red" )
load( "C77986", "old pink" )
load( "D6FFFE", "very pale blue" )
load( "FE4B03", "blood orange" )
load( "FD5956", "grapefruit" )
load( "FCE166", "sand yellow" )
load( "B2713D", "clay brown" )
load( "1F3B4D", "dark blue grey" )
load( "699D4C", "flat green" )
load( "56FCA2", "light green blue" )
load( "FB5581", "warm pink" )
load( "3E82FC", "dodger blue" )
load( "A0BF16", "gross green" )
load( "D6FFFA", "ice" )
load( "4F738E", "metallic blue" )
load( "FFB19A", "pale salmon" )
load( "5C8B15", "sap green" )
load( "54AC68", "algae" )
load( "89A0B0", "bluey grey" )
load( "7EA07A", "greeny grey" )
load( "1BFC06", "highlighter green" )
load( "CAFFFB", "light light blue" )
load( "B6FFBB", "light mint" )
load( "A75E09", "raw umber" )
load( "152EFF", "vivid blue" )
load( "8D5EB7", "deep lavender" )
load( "5F9E8F", "dull teal" )
load( "63F7B4", "light greenish blue" )
load( "606602", "mud green" )
load( "FC86AA", "pinky" )
load( "8C0034", "red wine" )
load( "758000", "shit green" )
load( "AB7E4C", "tan brown" )
load( "030764", "darkblue" )
load( "FE86A4", "rosa" )
load( "D5174E", "lipstick" )
load( "FED0FC", "pale mauve" )
load( "680018", "claret" )
load( "FEDF08", "dandelion" )
load( "FE420F", "orangered" )
load( "6F7C00", "poop green" )
load( "CA0147", "ruby" )
load( "1B2431", "dark" )
load( "00FBB0", "greenish turquoise" )
load( "DB5856", "pastel red" )
load( "DDD618", "piss yellow" )
load( "41FDFE", "bright cyan" )
load( "CF524E", "dark coral" )
load( "21C36F", "algae green" )
load( "A90308", "darkish red" )
load( "6E1005", "reddy brown" )
load( "FE828C", "blush pink" )
load( "4B6113", "camouflage green" )
load( "4DA409", "lawn green" )
load( "BEAE8A", "putty" )
load( "0339F8", "vibrant blue" )
load( "A88F59", "dark sand" )
load( "5D21D0", "purple/blue" )
load( "FEB209", "saffron" )
load( "4E518B", "twilight" )
load( "964E02", "warm brown" )
load( "85A3B2", "bluegrey" )
load( "FF69AF", "bubble gum pink" )
load( "C3FBF4", "duck egg blue" )
load( "2AFEB7", "greenish cyan" )
load( "005F6A", "petrol" )
load( "0C1793", "royal" )
load( "FFFF81", "butter" )
load( "F0833A", "dusty orange" )
load( "F1F33F", "off yellow" )
load( "B1D27B", "pale olive green" )
load( "FC824A", "orangish" )
load( "71AA34", "leaf" )
load( "B7C9E2", "light blue grey" )
load( "4B0101", "dried blood" )
load( "A552E6", "lightish purple" )
load( "AF2F0D", "rusty red" )
load( "8B88F8", "lavender blue" )
load( "9AF764", "light grass green" )
load( "A6FBB2", "light mint green" )
load( "FFC512", "sunflower" )
load( "750851", "velvet" )
load( "C14A09", "brick orange" )
load( "FE2F4A", "lightish red" )
load( "0203E2", "pure blue" )
load( "0A437A", "twilight blue" )
load( "A50055", "violet red" )
load( "AE8B0C", "yellowy brown" )
load( "FD798F", "carnation" )
load( "BFAC05", "muddy yellow" )
load( "3EAF76", "dark seafoam green" )
load( "C74767", "deep rose" )
load( "B9484E", "dusty red" )
load( "647D8E", "grey/blue" )
load( "BFFE28", "lemon lime" )
load( "D725DE", "purple/pink" )
load( "B29705", "brown yellow" )
load( "673A3F", "purple brown" )
load( "A87DC2", "wisteria" )
load( "FAFE4B", "banana yellow" )
load( "C0022F", "lipstick red" )
load( "0E87CC", "water blue" )
load( "8D8468", "brown grey" )
load( "AD03DE", "vibrant purple" )
load( "8CFF9E", "baby green" )
load( "94AC02", "barf green" )
load( "C4FFF7", "eggshell blue" )
load( "FDEE73", "sandy yellow" )
load( "33B864", "cool green" )
load( "FFF9D0", "pale" )
load( "758DA3", "blue/grey" )
load( "F504C9", "hot magenta" )
load( "77A1B5", "greyblue" )
load( "8756E4", "purpley" )
load( "889717", "baby shit green" )
load( "C27E79", "brownish pink" )
load( "017371", "dark aquamarine" )
load( "9F8303", "diarrhea" )
load( "F7D560", "light mustard" )
load( "BDF6FE", "pale sky blue" )
load( "75B84F", "turtle green" )
load( "9CBB04", "bright olive" )
load( "29465B", "dark grey blue" )
load( "696006", "greeny brown" )
load( "ADF802", "lemon green" )
load( "C1C6FC", "light periwinkle" )
load( "35AD6B", "seaweed green" )
load( "FFFD37", "sunshine yellow" )
load( "A442A0", "ugly purple" )
load( "F36196", "medium pink" )
load( "947706", "puke brown" )
load( "FFF4F2", "very light pink" )
load( "1E9167", "viridian" )
load( "B5C306", "bile" )
load( "FEFF7F", "faded yellow" )
load( "CFFDBC", "very pale green" )
load( "0ADD08", "vibrant green" )
load( "87FD05", "bright lime" )
load( "1EF876", "spearmint" )
load( "7BFDC7", "light aquamarine" )
load( "BCECAC", "light sage" )
load( "BBF90F", "yellowgreen" )
load( "AB9004", "baby poo" )
load( "1FB57A", "dark seafoam" )
load( "00555A", "deep teal" )
load( "A484AC", "heather" )
load( "C45508", "rust orange" )
load( "3F829D", "dirty blue" )
load( "548D44", "fern green" )
load( "C95EFB", "bright lilac" )
load( "3AE57F", "weird green" )
load( "016795", "peacock blue" )
load( "87A922", "avocado green" )
load( "F0944D", "faded orange" )
load( "5D1451", "grape purple" )
load( "25FF29", "hot green" )
load( "D0FE1D", "lime yellow" )
load( "FFA62B", "mango" )
load( "01B44C", "shamrock" )
load( "FF6CB5", "bubblegum" )
load( "6B4247", "purplish brown" )
load( "C7C10C", "vomit yellow" )
load( "B7FFFA", "pale cyan" )
load( "AEFF6E", "key lime" )
load( "EC2D01", "tomato red" )
load( "76FF7B", "lightgreen" )
load( "730039", "merlot" )
load( "040348", "night blue" )
load( "DF4EC8", "purpleish pink" )
load( "6ECB3C", "apple" )
load( "8F9805", "baby poop green" )
load( "5EDC1F", "green apple" )
load( "D94FF5", "heliotrope" )
load( "C8FD3D", "yellow/green" )
load( "070D0D", "almost black" )
load( "4984B8", "cool blue" )
load( "51B73B", "leafy green" )
load( "AC7E04", "mustard brown" )
load( "4E5481", "dusk" )
load( "876E4B", "dull brown" )
load( "58BC08", "frog green" )
load( "2FEF10", "vivid green" )
load( "2DFE54", "bright light green" )
load( "0AFF02", "fluro green" )
load( "9CEF43", "kiwi" )
load( "18D17B", "seaweed" )
load( "35530A", "navy green" )
load( "1805DB", "ultramarine blue" )
load( "6258C4", "iris" )
load( "FF964F", "pastel orange" )
load( "FFAB0F", "yellowish orange" )
load( "8F8CE7", "perrywinkle" )
load( "24BCA8", "tealish" )
load( "3F012C", "dark plum" )
load( "CBF85F", "pear" )
load( "FF724C", "pinkish orange" )
load( "280137", "midnight purple" )
load( "B36FF6", "light urple" )
load( "48C072", "dark mint" )
load( "BCCB7A", "greenish tan" )
load( "A8415B", "light burgundy" )
load( "06B1C4", "turquoise blue" )
load( "CD7584", "ugly pink" )
load( "F1DA7A", "sandy" )
load( "FF0490", "electric pink" )
load( "805B87", "muted purple" )
load( "50A747", "mid green" )
load( "A8A495", "greyish" )
load( "CFFF04", "neon yellow" )
load( "FFFF7E", "banana" )
load( "FF7FA7", "carnation pink" )
load( "EF4026", "tomato" )
load( "3C9992", "sea" )
load( "886806", "muddy brown" )
load( "04F489", "turquoise green" )
load( "FEF69E", "buff" )
load( "CFAF7B", "fawn" )
load( "3B719F", "muted blue" )
load( "FDC1C5", "pale rose" )
load( "20C073", "dark mint green" )
load( "9B5FC0", "amethyst" )
load( "0F9B8E", "blue/green" )
load( "742802", "chestnut" )
load( "9DB92C", "sick green" )
load( "A4BF20", "pea" )
load( "CD5909", "rusty orange" )
load( "ADA587", "stone" )
load( "BE013C", "rose red" )
load( "B8FFEB", "pale aqua" )
load( "DC4D01", "deep orange" )
load( "A2653E", "earth" )
load( "638B27", "mossy green" )
load( "419C03", "grassy green" )
load( "B1FF65", "pale lime green" )
load( "9DBCD4", "light grey blue" )
load( "FDFDFE", "pale grey" )
load( "77AB56", "asparagus" )
load( "464196", "blueberry" )
load( "990147", "purple red" )
load( "BEFD73", "pale lime" )
load( "32BF84", "greenish teal" )
load( "AF6F09", "caramel" )
load( "A0025C", "deep magenta" )
load( "FFD8B1", "light peach" )
load( "7F4E1E", "milk chocolate" )
load( "BF9B0C", "ocher" )
load( "6BA353", "off green" )
load( "F075E6", "purply pink" )
load( "7BC8F6", "lightblue" )
load( "475F94", "dusky blue" )
load( "F5BF03", "golden" )
load( "FFFEB6", "light beige" )
load( "FFFD74", "butter yellow" )
load( "895B7B", "dusky purple" )
load( "436BAD", "french blue" )
load( "D0C101", "ugly yellow" )
load( "C6F808", "greeny yellow" )
load( "F43605", "orangish red" )
load( "02C14D", "shamrock green" )
load( "B25F03", "orangish brown" )
load( "2A7E19", "tree green" )
load( "490648", "deep violet" )
load( "536267", "gunmetal" )
load( "5A06EF", "blue/purple" )
load( "CF0234", "cherry" )
load( "C4A661", "sandy brown" )
load( "978A84", "warm grey" )
load( "1F0954", "dark indigo" )
load( "03012D", "midnight" )
load( "2BB179", "bluey green" )
load( "C3909B", "grey pink" )
load( "A66FB5", "soft purple" )
load( "770001", "blood" )
load( "922B05", "brown red" )
load( "7D7F7C", "medium grey" )
load( "990F4B", "berry" )
load( "8F7303", "poo" )
load( "C83CB9", "purpley pink" )
load( "FEA993", "light salmon" )
load( "ACBB0D", "snot" )
load( "C071FE", "easter purple" )
load( "CCFD7F", "light yellow green" )
load( "00022E", "dark navy blue" )
load( "828344", "drab" )
load( "FFC5CB", "light rose" )
load( "AB1239", "rouge" )
load( "B0054B", "purplish red" )
load( "99CC04", "slime green" )
load( "937C00", "baby poop" )
load( "019529", "irish green" )
load( "EF1DE7", "pink/purple" )
load( "000435", "dark navy" )
load( "42B395", "greeny blue" )
load( "9D5783", "light plum" )
load( "C8ACA9", "pinkish grey" )
load( "C87606", "dirty orange" )
load( "AA2704", "rust red" )
load( "E4CBFF", "pale lilac" )
load( "FA4224", "orangey red" )
load( "0804F9", "primary blue" )
load( "5CB200", "kermit green" )
load( "76424E", "brownish purple" )
load( "6C7A0E", "murky green" )
load( "FBDD7E", "wheat" )
load( "2A0134", "very dark purple" )
load( "044A05", "bottle green" )
load( "FD4659", "watermelon" )
load( "0D75F8", "deep sky blue" )
load( "FE0002", "fire engine red" )
load( "CB9D06", "yellow ochre" )
load( "FB7D07", "pumpkin orange" )
load( "B9CC81", "pale olive" )
load( "EDC8FF", "light lilac" )
load( "61E160", "lightish green" )
load( "8AB8FE", "carolina blue" )
load( "920A4E", "mulberry" )
load( "FE02A2", "shocking pink" )
load( "9A3001", "auburn" )
load( "65FE08", "bright lime green" )
load( "BEFDB7", "celadon" )
load( "B17261", "pinkish brown" )
load( "885F01", "poo brown" )
load( "02CCFE", "bright sky blue" )
load( "C1FD95", "celery" )
load( "836539", "dirt brown" )
load( "FB2943", "strawberry" )
load( "84B701", "dark lime" )
load( "B66325", "copper" )
load( "7F5112", "medium brown" )
load( "5FA052", "muted green" )
load( "6DEDFD", "robin's egg" )
load( "0BF9EA", "bright aqua" )
load( "C760FF", "bright lavender" )
load( "FFFFCB", "ivory" )
load( "F6CEFC", "very light purple" )
load( "155084", "light navy" )
load( "F5054F", "pink red" )
load( "645403", "olive brown" )
load( "7A5901", "poop brown" )
load( "A8B504", "mustard green" )
load( "3D9973", "ocean green" )
load( "000133", "very dark blue" )
load( "76A973", "dusty green" )
load( "2E5A88", "light navy blue" )
load( "0BF77D", "minty green" )
load( "BD6C48", "adobe" )
load( "AC1DB8", "barney" )
load( "2BAF6A", "jade green" )
load( "26F7FD", "bright light blue" )
load( "AEFD6C", "light lime" )
load( "9B8F55", "dark khaki" )
load( "FFAD01", "orange yellow" )
load( "C69C04", "ocre" )
load( "F4D054", "maize" )
load( "DE9DAC", "faded pink" )
load( "05480D", "british racing green" )
load( "C9AE74", "sandstone" )
load( "60460F", "mud brown" )
load( "98F6B0", "light sea green" )
load( "8AF1FE", "robin egg blue" )
load( "2EE8BB", "aqua marine" )
load( "11875D", "dark sea green" )
load( "FDB0C0", "soft pink" )
load( "B16002", "orangey brown" )
load( "F7022A", "cherry red" )
load( "D5AB09", "burnt yellow" )
load( "86775F", "brownish grey" )
load( "C69F59", "camel" )
load( "7A687F", "purplish grey" )
load( "042E60", "marine" )
load( "C88D94", "greyish pink" )
load( "A5FBD5", "pale turquoise" )
load( "FFFE71", "pastel yellow" )
load( "6241C7", "bluey purple" )
load( "FFFE40", "canary yellow" )
load( "D3494E", "faded red" )
load( "985E2B", "sepia" )
load( "A6814C", "coffee" )
load( "FF08E8", "bright magenta" )
load( "9D7651", "mocha" )
load( "FEFFCA", "ecru" )
load( "98568D", "purpleish" )
load( "9E003A", "cranberry" )
load( "287C37", "darkish green" )
load( "B96902", "brown orange" )
load( "BA6873", "dusky rose" )
load( "FF7855", "melon" )
load( "94B21C", "sickly green" )
load( "C5C9C7", "silver" )
load( "661AEE", "purply blue" )
load( "6140EF", "purpleish blue" )
load( "9BE5AA", "hospital green" )
load( "7B5804", "shit brown" )
load( "276AB3", "mid blue" )
load( "FEB308", "amber" )
load( "8CFD7E", "easter green" )
load( "6488EA", "soft blue" )
load( "056EEE", "cerulean blue" )
load( "B27A01", "golden brown" )
load( "0FFEF9", "bright turquoise" )
load( "FA2A55", "red pink" )
load( "820747", "red purple" )
load( "7A6A4F", "greyish brown" )
load( "F4320C", "vermillion" )
load( "A13905", "russet" )
load( "6F828A", "steel grey" )
load( "A55AF4", "lighter purple" )
load( "AD0AFD", "bright violet" )
load( "004577", "prussian blue" )
load( "658D6D", "slate green" )
load( "CA7B80", "dirty pink" )
load( "005249", "dark blue green" )
load( "2B5D34", "pine" )
load( "BFF128", "yellowy green" )
load( "B59410", "dark gold" )
load( "2976BB", "bluish" )
load( "014182", "darkish blue" )
load( "BB3F3F", "dull red" )
load( "FC2647", "pinky red" )
load( "A87900", "bronze" )
load( "82CBB2", "pale teal" )
load( "667C3E", "military green" )
load( "FE46A5", "barbie pink" )
load( "FE83CC", "bubblegum pink" )
load( "94A617", "pea soup green" )
load( "A88905", "dark mustard" )
load( "7F5F00", "shit" )
load( "9E43A2", "medium purple" )
load( "062E03", "very dark green" )
load( "8A6E45", "dirt" )
load( "CC7A8B", "dusky pink" )
load( "9E0168", "red violet" )
load( "FDFF38", "lemon yellow" )
load( "C0FA8B", "pistachio" )
load( "EEDC5B", "dull yellow" )
load( "7EBD01", "dark lime green" )
load( "3B5B92", "denim blue" )
load( "01889F", "teal blue" )
load( "3D7AFD", "lightish blue" )
load( "5F34E7", "purpley blue" )
load( "6D5ACF", "light indigo" )
load( "748500", "swamp green" )
load( "706C11", "brown green" )
load( "3C0008", "dark maroon" )
load( "CB00F5", "hot purple" )
load( "002D04", "dark forest green" )
load( "658CBB", "faded blue" )
load( "749551", "drab green" )
load( "B9FF66", "light lime green" )
load( "9DC100", "snot green" )
load( "FAEE66", "yellowish" )
load( "7EFBB3", "light blue green" )
load( "7B002C", "bordeaux" )
load( "C292A1", "light mauve" )
load( "017B92", "ocean" )
load( "FCC006", "marigold" )
load( "657432", "muddy green" )
load( "D8863B", "dull orange" )
load( "738595", "steel" )
load( "AA23FF", "electric purple" )
load( "08FF08", "fluorescent green" )
load( "9B7A01", "yellowish brown" )
load( "F29E8E", "blush" )
load( "6FC276", "soft green" )
load( "FF5B00", "bright orange" )
load( "FDFF52", "lemon" )
load( "866F85", "purple grey" )
load( "8FFE09", "acid green" )
load( "EECFFE", "pale lavender" )
load( "510AC9", "violet blue" )
load( "4F9153", "light forest green" )
load( "9F2305", "burnt red" )
load( "728639", "khaki green" )
load( "DE0C62", "cerise" )
load( "916E99", "faded purple" )
load( "FFB16D", "apricot" )
load( "3C4D03", "dark olive green" )
load( "7F7053", "grey brown" )
load( "77926F", "green grey" )
load( "010FCC", "true blue" )
load( "CEAEFA", "pale violet" )
load( "8F99FB", "periwinkle blue" )
load( "C6FCFF", "light sky blue" )
load( "5539CC", "blurple" )
load( "544E03", "green brown" )
load( "017A79", "bluegreen" )
load( "01F9C6", "bright teal" )
load( "C9B003", "brownish yellow" )
load( "929901", "pea soup" )
load( "0B5509", "forest" )
load( "A00498", "barney purple" )
load( "2000B1", "ultramarine" )
load( "94568C", "purplish" )
load( "C2BE0E", "puke yellow" )
load( "748B97", "bluish grey" )
load( "665FD1", "dark periwinkle" )
load( "9C6DA5", "dark lilac" )
load( "C44240", "reddish" )
load( "A24857", "light maroon" )
load( "825F87", "dusty purple" )
load( "C9643B", "terra cotta" )
load( "90B134", "avocado" )
load( "01386A", "marine blue" )
load( "25A36F", "teal green" )
load( "59656D", "slate grey" )
load( "75FD63", "lighter green" )
load( "21FC0D", "electric green" )
load( "5A86AD", "dusty blue" )
load( "FEC615", "golden yellow" )
load( "FFFD01", "bright yellow" )
load( "DFC5FE", "light lavender" )
load( "B26400", "umber" )
load( "7F5E00", "poop" )
load( "DE7E5D", "dark peach" )
load( "048243", "jungle green" )
load( "FFFFD4", "eggshell" )
load( "3B638C", "denim" )
load( "B79400", "yellow brown" )
load( "84597E", "dull purple" )
load( "411900", "chocolate brown" )
load( "7B0323", "wine red" )
load( "04D9FF", "neon blue" )
load( "667E2C", "dirty green" )
load( "FBEEAC", "light tan" )
load( "D7FFFE", "ice blue" )
load( "4E7496", "cadet blue" )
load( "874C62", "dark mauve" )
load( "D5FFFF", "very light blue" )
load( "826D8C", "grey purple" )
load( "FFBACD", "pastel pink" )
load( "D1FFBD", "very light green" )
load( "448EE4", "dark sky blue" )
load( "05472A", "evergreen" )
load( "D5869D", "dull pink" )
load( "3D0734", "aubergine" )
load( "4A0100", "mahogany" )
load( "F8481C", "reddish orange" )
load( "02590F", "deep green" )
load( "89A203", "vomit green" )
load( "E03FD8", "purple pink" )
load( "D58A94", "dusty pink" )
load( "7BB274", "faded green" )
load( "526525", "camo green" )
load( "C94CBE", "pinky purple" )
load( "DB4BDA", "pink purple" )
load( "9E3623", "brownish red" )
load( "B5485D", "dark rose" )
load( "735C12", "mud" )
load( "9C6D57", "brownish" )
load( "028F1E", "emerald green" )
load( "B1916E", "pale brown" )
load( "49759C", "dull blue" )
load( "A0450E", "burnt umber" )
load( "39AD48", "medium green" )
load( "B66A50", "clay" )
load( "8CFFDB", "light aqua" )
load( "A4BE5C", "light olive green" )
load( "CB7723", "brownish orange" )
load( "05696B", "dark aqua" )
load( "CE5DAE", "purplish pink" )
load( "C85A53", "dark salmon" )
load( "96AE8D", "greenish grey" )
load( "1FA774", "jade" )
load( "7A9703", "ugly green" )
load( "AC9362", "dark beige" )
load( "01A049", "emerald" )
load( "D9544D", "pale red" )
load( "FA5FF7", "light magenta" )
load( "82CAFC", "sky" )
load( "ACFFFC", "light cyan" )
load( "FCB001", "yellow orange" )
load( "910951", "reddish purple" )
load( "FE2C54", "reddish pink" )
load( "C875C4", "orchid" )
load( "CDC50A", "dirty yellow" )
load( "FD411E", "orange red" )
load( "9A0200", "deep red" )
load( "BE6400", "orange brown" )
load( "030AA7", "cobalt blue" )
load( "FE019A", "neon pink" )
load( "F7879A", "rose pink" )
load( "887191", "greyish purple" )
load( "B00149", "raspberry" )
load( "12E193", "aqua green" )
load( "FE7B7C", "salmon pink" )
load( "FF9408", "tangerine" )
load( "6A6E09", "brownish green" )
load( "8B2E16", "red brown" )
load( "696112", "greenish brown" )
load( "E17701", "pumpkin" )
load( "0A481E", "pine green" )
load( "343837", "charcoal" )
load( "FFB7CE", "baby pink" )
load( "6A79F7", "cornflower" )
load( "5D06E9", "blue violet" )
load( "3D1C02", "chocolate" )
load( "82A67D", "greyish green" )
load( "BE0119", "scarlet" )
load( "C9FF27", "green yellow" )
load( "373E02", "dark olive" )
load( "A9561E", "sienna" )
load( "CAA0FF", "pastel purple" )
load( "CA6641", "terracotta" )
load( "02D8E9", "aqua blue" )
load( "88B378", "sage green" )
load( "980002", "blood red" )
load( "CB0162", "deep pink" )
load( "5CAC2D", "grass" )
load( "769958", "moss" )
load( "A2BFFE", "pastel blue" )
load( "10A674", "bluish green" )
load( "06B48B", "green blue" )
load( "AF884A", "dark tan" )
load( "0B8B87", "greenish blue" )
load( "FFA756", "pale orange" )
load( "A2A415", "vomit" )
load( "154406", "forrest green" )
load( "856798", "dark lavender" )
load( "34013F", "dark violet" )
load( "632DE9", "purple blue" )
load( "0A888A", "dark cyan" )
load( "6F7632", "olive drab" )
load( "D46A7E", "pinkish" )
load( "1E488F", "cobalt" )
load( "BC13FE", "neon purple" )
load( "7EF4CC", "light turquoise" )
load( "76CD26", "apple green" )
load( "74A662", "dull green" )
load( "80013F", "wine" )
load( "B1D1FC", "powder blue" )
load( "FFFFE4", "off white" )
load( "0652FF", "electric blue" )
load( "045C5A", "dark turquoise" )
load( "5729CE", "blue purple" )
load( "069AF3", "azure" )
load( "FF000D", "bright red" )
load( "F10C45", "pinkish red" )
load( "5170D7", "cornflower blue" )
load( "ACBF69", "light olive" )
load( "6C3461", "grape" )
load( "5E819D", "greyish blue" )
load( "601EF9", "purplish blue" )
load( "B0DD16", "yellowish green" )
load( "CDFD02", "greenish yellow" )
load( "2C6FBB", "medium blue" )
load( "C0737A", "dusty rose" )
load( "D6B4FC", "light violet" )
load( "020035", "midnight blue" )
load( "703BE7", "bluish purple" )
load( "FD3C06", "red orange" )
load( "960056", "dark magenta" )
load( "40A368", "greenish" )
load( "03719C", "ocean blue" )
load( "FC5A50", "coral" )
load( "FFFFC2", "cream" )
load( "7F2B0A", "reddish brown" )
load( "B04E0F", "burnt sienna" )
load( "A03623", "brick" )
load( "87AE73", "sage" )
load( "789B73", "grey green" )
load( "FFFFFF", "white" )
load( "98EFF9", "robin's egg blue" )
load( "658B38", "moss green" )
load( "5A7D9A", "steel blue" )
load( "380835", "eggplant" )
load( "FFFE7A", "light yellow" )
load( "5CA904", "leaf green" )
load( "D8DCD6", "light grey" )
load( "A5A502", "puke" )
load( "D648D7", "pinkish purple" )
load( "047495", "sea blue" )
load( "B790D4", "pale purple" )
load( "5B7C99", "slate blue" )
load( "607C8E", "blue grey" )
load( "0B4008", "hunter green" )
load( "ED0DD9", "fuchsia" )
load( "8C000F", "crimson" )
load( "FFFF84", "pale yellow" )
load( "BF9005", "ochre" )
load( "D2BD0A", "mustard yellow" )
load( "FF474C", "light red" )
load( "0485D1", "cerulean" )
load( "FFCFDC", "pale pink" )
load( "040273", "deep blue" )
load( "A83C09", "rust" )
load( "90E4C1", "light teal" )
load( "516572", "slate" )
load( "FAC205", "goldenrod" )
load( "D5B60A", "dark yellow" )
load( "363737", "dark grey" )
load( "4B5D16", "army green" )
load( "6B8BA4", "grey blue" )
load( "80F9AD", "seafoam" )
load( "A57E52", "puce" )
load( "A9F971", "spring green" )
load( "C65102", "dark orange" )
load( "E2CA76", "sand" )
load( "B0FF9D", "pastel green" )
load( "9FFEB0", "mint" )
load( "FDAA48", "light orange" )
load( "FE01B1", "bright pink" )
load( "C1F80A", "chartreuse" )
load( "36013F", "deep purple" )
load( "341C02", "dark brown" )
load( "B9A281", "taupe" )
load( "8EAB12", "pea green" )
load( "9AAE07", "puke green" )
load( "02AB2E", "kelly green" )
load( "7AF9AB", "seafoam green" )
load( "137E6D", "blue green" )
load( "AAA662", "khaki" )
load( "610023", "burgundy" )
load( "014D4E", "dark teal" )
load( "8F1402", "brick red" )
load( "4B006E", "royal purple" )
load( "580F41", "plum" )
load( "8FFF9F", "mint green" )
load( "DBB40C", "gold" )
load( "A2CFFE", "baby blue" )
load( "C0FB2D", "yellow green" )
load( "BE03FD", "bright purple" )
load( "840000", "dark red" )
load( "D0FEFE", "pale blue" )
load( "3F9B0B", "grass green" )
load( "01153E", "navy" )
load( "04D8B2", "aquamarine" )
load( "C04E01", "burnt orange" )
load( "0CFF0C", "neon green" )
load( "0165FC", "bright blue" )
load( "CF6275", "rose" )
load( "FFD1DF", "light pink" )
load( "CEB301", "mustard" )
load( "380282", "indigo" )
load( "AAFF32", "lime" )
load( "53FCA1", "sea green" )
load( "8E82FE", "periwinkle" )
load( "CB416B", "dark pink" )
load( "677A04", "olive green" )
load( "FFB07C", "peach" )
load( "C7FDB5", "pale green" )
load( "AD8150", "light brown" )
load( "FF028D", "hot pink" )
load( "000000", "black" )
load( "CEA2FD", "lilac" )
load( "001146", "navy blue" )
load( "0504AA", "royal blue" )
load( "E6DAA6", "beige" )
load( "FF796C", "salmon" )
load( "6E750E", "olive" )
load( "650021", "maroon" )
load( "01FF07", "bright green" )
load( "35063E", "dark purple" )
load( "AE7181", "mauve" )
load( "06470C", "forest green" )
load( "13EAC9", "aqua" )
load( "00FFFF", "cyan" )
load( "D1B26F", "tan" )
load( "00035B", "dark blue" )
load( "C79FEF", "lavender" )
load( "06C2AC", "turquoise" )
load( "033500", "dark green" )
load( "9A0EEA", "violet" )
load( "BF77F6", "light purple" )
load( "89FE05", "lime green" )
load( "929591", "grey" )
load( "75BBFD", "sky blue" )
load( "FFFF14", "yellow" )
load( "C20078", "magenta" )
load( "96F97B", "light green" )
load( "F97306", "orange" )
load( "029386", "teal" )
load( "95D0FC", "light blue" )
load( "E50000", "red" )
load( "653700", "brown" )
load( "FF81C0", "pink" )
load( "0343DF", "blue" )
load( "15B01A", "green" )
load( "7E1E9C", "purple" )

-------------------------------------------------------------------------------
return rgb
