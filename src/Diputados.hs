module Diputados where

import qualified Data.Map as M
import Data.List

{-
Artículo ciento sesenta y uno.
  1. Para la elección de Diputados y Senadores, cada provincia constituirá una
    circunscripción electoral. Asimismo, las ciudades de Ceuta y Melilla serán consideradas,
    cada una de ellas, como circunscripciones electorales.
  2. Se exceptúa de lo dispuesto en el párrafo anterior, para las elecciones de Senadores,
    a las Provincias insulares, en las que a tales efectos se consideran circunscripciones cada
    una de las siguientes islas o agrupaciones de islas: Mallorca, Menorca, Ibiza-Formentera,
    Gran Canaria, Fuerteventura, Lanzarote, Tenerife, Hierro, Gomera y La Palma.
-}
data Circunscripcion
  = Alava
  | Albacete
  | Alicante
  | Almeria
  | Avila
  | Badajoz
  | Barcelona
  | Burgos
  | Caceres
  | Cadiz
  | Castellon
  | CiudadReal
  | Cordoba
  | Cuenca
  | Gerona
  | Granada
  | Guadalajara
  | Guipuzcoa
  | Huelva
  | Huesca
  | Jaen
  | LaCoruna
  | LaRioja
  | LasPalmas
  | Leon
  | Lerida
  | Lugo
  | Madrid
  | Malaga
  | Murcia
  | Navarra
  | Orense
  | Palencia
  | Pontevedra
  | Salamanca
  | SantaCruzTenerife
  | Segovia
  | Sevilla
  | Soria
  | Tarragona
  | Teruel
  | Toledo
  | Valencia
  | Valladolid
  | Vizcaya
  | Zamora
  | Zaragoza
  | Ceuta
  | Melilla
  deriving (Show, Eq, Ord, Enum, Bounded)

{-
Artículo ciento sesenta y dos.
1. el congreso está formado por trescientos cincuenta diputados.
2. a cada provincia le corresponde un mínimo inicial de dos diputados. las poblaciones de ceuta y melilla están representadas cada una de ellas por un diputado.
3. los doscientos cuarenta y ocho diputados restantes se distribuyen entre las provincias en proporción a su población, conforme al siguiente procedimiento:
a) se obtiene una cuota de reparto resultante de dividir por doscientos cuarenta y ocho la
cifra total de la población de derecho de las provincias peninsulares e insulares.
b) se adjudican a cada provincia tantos diputados como resulten, en números enteros,
de dividir la población de derecho provincial por la cuota de reparto.
c) los diputados restantes se distribuyen asignando uno a cada una de las provincias
cuyo cociente, obtenido conforme al apartado anterior, tenga una fracción decimal mayor.
4. el decreto de convocatoria debe especificar el número de diputados a elegir en cada
circunscripción, de acuerdo con lo dispuesto en este artículo.
-}

type Poblacion = Int
type Diputados = Int

-- Function to calculate the number of diputados for a given Circunscripcion
numDiputados :: M.Map Circunscripcion Poblacion -> M.Map Circunscripcion Diputados
numDiputados poblacionMap = M.mapWithKey calculateDiputados poblacionMap where
    totalPoblacion = sum (M.elems poblacionMap)
    cuotaReparto = totalPoblacion `div` 248
    baseDiputadosMap = M.map (\p -> p `div` cuotaReparto) poblacionMap
    remainingDiputados = 248 - (sum $ M.elems baseDiputadosMap)
    topFractionals = take remainingDiputados $ reverse $ sort $ M.toList $ M.mapWithKey (\k v -> (fromIntegral (poblacionMap M.! k) `div` fromIntegral cuotaReparto) - fromIntegral v) poblacionMap
    calculateDiputados k v
        | k == Ceuta || k == Melilla = 1
        | otherwise = 2 + (baseDiputadosMap M.! k) + (if (k,v) `elem` topFractionals then 1 else 0)

