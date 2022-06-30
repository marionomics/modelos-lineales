def run():
    from pandas import read_csv

    df = read_csv("clase/grades.csv")
    print(df.name)
    i = input("Hola! Para saber tu calificación escribe el número en el que apareces en la lista de arriba: ")
    print("Hola " + str(df.iloc[int(i),0]) +"!")
    calificacion = df.iloc[int(i),1]*0.3 + df.iloc[int(i),2]*0.2 + df.iloc[int(i),3]*0.1 + df.iloc[int(i),4]*0.4
    print("Tu calificación es " + str(calificacion))
    

if __name__ == "__main__":
    run()