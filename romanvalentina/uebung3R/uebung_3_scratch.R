# aufgabe 8

# which are categorical, which are quantitative

# a categorical
# b quantitative
# c categorical
# d categorical
# e quantitative
# f quantitative

# aufgabe 9

N_Milchbauern <- 10
Jahreseinkommen_Milchbauer <- 10000
N_Millionaer <- 1
Jahreseinkommen_Millionaer <- 100000000

# by hand
mean.income <- mean(c(rep(Jahreseinkommen_Milchbauer,N_Milchbauern),rep(Jahreseinkommen_Millionaer,N_Millionaer)))

median.income <- median(c(rep(Jahreseinkommen_Milchbauer,N_Milchbauern),rep(Jahreseinkommen_Millionaer,N_Millionaer)))

# Der Median ist ein geeigneteres Maß, das "mittlere Jahreseinkommen" in diesem schweizer Bergdorf zu beschreiben.
# Der Mittelwert eignet sich z.B. für normalverteilte, oder allgemeiner für symmetrische Daten.
# Ausreißer haben ein zu starkes Gewicht beim Mittelwert. Beschreibung über Mediane, somit der mittleren Datenpunkte, ist für schiefe Datenverteilungen besser geeignet.


# Aufgabe 10

cs <- c(63.79,108.32,132.53,29.63,112.87,115.18,82.76,83.6,83.07,73.30,85.68,70.05)

vari <- function(ve){
  miwe <- 86.73167
  summe <- 0.0
  print(length(ve))
  for (i in 1:12){
    print(i)
    summe = summe + (ve[i]-miwe)**2
  }
  v = summe / (length(ve) - 1)
  return(v)
}

test = vari(cs)

