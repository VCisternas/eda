library(base)
df = data.frame(faithful)


# a: 5 point summary
summary(df)


# boxplot
boxplot(df$eruptions, col = "green", ylab = "duration of eruption [minutes]")


# stem and leaf plot
stem(df$eruptions)


# emp verteilungsfunktion
plot(ecdf(df$eruptions))


# hist inkl rug plot
hist(df$eruptions, breaks = 20, col = "blue", xlab = "duration of eruption [minutes]", ylab = "test")
rug(df$eruptions)


