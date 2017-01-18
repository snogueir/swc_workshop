# this is a script of SCW
Date January 18
Sarah Nogueira

age <- c(1,3,5,7,9)
#these are the ages of the people in the family
names (age) <- c("Martha", "Peter", "Paul", "Mary", "Ruth")

download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "gapminder-FiveYearData.csv")
gapminder <- read.csv("gapminder-FiveYearData.csv")

#head
#str
#ncol
#summary
#view
#nrow
#African countries life expectancies for 2007
#step 1: get 2007
is_2007 <- gapminder$year == 2007
#step 2: get Africa
is_Africa <-gapminder$continent == "Africa"
#step 3: pull 2007 & Africa from gapminder
africa_2007 <- gapminder [is_2007 & is_Africa, c("country", "year", "lifeExp")]

o <- order(africa_2007$lifeExp)

africa_2007[o, ]

ggplot(data=gapminder, aes (x=year, y=lifeExp))+ geom_point()

ggplot(data=gapminder, aes (x=year, y=lifeExp, color=continent))+ geom_point()

ggplot(data=gapminder, aes (x=year, y=lifeExp, color=continent))+ geom_line()+ geom_point()

ggplot(data=gapminder, aes (x=year, y=lifeExp, by=country,color=continent))+ geom_point()

ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) + geom_point() +facet_grid(.~continent)
 
#save plot
ggsave(filename="year_vs_lifexp_percont.png", width= 5, height= 4, units = "in")
