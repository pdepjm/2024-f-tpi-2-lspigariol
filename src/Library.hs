module Library where
import PdePreludat
import Data.Char

doble :: Number -> Number
doble numero = numero + numero

type Cancion = String

data Artista = UnArtista {
    nombre :: String,
    canciones :: [Cancion]
} deriving Show

fitito :: Artista
fitito = UnArtista "Fitito Paez" ["11 y 6", "El amor despues del amor", "Mariposa Tecknicolor"]

calamardo :: Artista
calamardo = UnArtista "Andres Calamardo" ["Flaca", "Sin Documentos", "Tuyo siempre"]

paty :: Artista
paty = UnArtista "Taylor Paty" ["Shake It Off", "Lover"]


{- SOLUCION 1
todosLosExitosos artistas = 
        filter ((> 50).sum.map ((10 +).length.filter 
        (flip elem (['a'..'z']++"áéíóúñü"))).filter 
        ((>20).((10 +).length.filter (flip elem 
        (['a'..'z']++"áéíóúñü")))).canciones) 
        artistas
-}

{- SOLUCION 2
calificacion = (10 +).length.filter esVocal

esVocal = flip elem (['a'..'z']++"áéíóúñü")

exitoso = (> 50).sum.map calificacion.filter ((>20).calificacion).canciones
exitoso' = (> 50).sum.filter (>20).map calificacion.canciones

todosLosExitosos artistas = filter exitoso artistas
-}


{- SOLUCION 3
calificacion cancion = 10 + cantidadMinusculas cancion 

cantidadMinusculas = length.filter esMinuscula

esMinuscula letra = elem letra letrasMinusculas

letrasMinusculas = ['a'..'z']++"áéíóúñü"

exitoso artista = totalCalificaciones (canciones artista) > 50

totalCalificaciones = sum.filter (>20).map calificacion

todosLosExitosos artistas = filter exitoso artistas
-}


--SOLUCION 4
calificacion cancion = 10 + cantidadMinusculas cancion 

cantidadMinusculas cancion = length (filter isLower cancion)

exitoso artista = sumaCalificaciones (cancionesBuenas artista) > 50

cancionesBuenas canciones = filter ((>20).calificacion) canciones

sumaCalificaciones canciones = sum (map calificacion canciones)

todosLosExitosos artistas = filter exitoso artistas
