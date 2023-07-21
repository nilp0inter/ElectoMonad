module Senadores where

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
  | Mallorca
  | Menorca
  | IbizaFormentera
  | GranCanaria
  | Fuerteventura
  | Lanzarote
  | Tenerife
  | Hierro
  | Gomera
  | LaPalma
  deriving (Show, Eq, Enum, Bounded)
