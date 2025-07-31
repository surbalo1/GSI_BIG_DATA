import pytesseract
from PIL import Image
import pandas as pd

img = Image.open("datos.png")
text = pytesseract.image_to_string(img)

# luego parseas el texto y lo guardas en CSV
with open("datos.csv", "w") as f:
    f.write(text)

img = Image.open('datos.png')
text = pytesseract.image_to_string(img)
print(text)  # para ver qué texto sacó el OCR