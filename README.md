# btc_modelling
**MODELOWANIE EKONOMETRYCZNE CENY BITCOINA | 06/2025**

**Narzędzia**
  * R
  * modele regresji liniowej
  testy stacjonarności (ADF, KPSS)
  procedury Cochrane-Orcutta
  transformacje Boxa-Coxa
  testy diagnostyczne (Breusch-Pagan, White, VIF, Chow, RESET)

**Problem**
Konieczność zbudowania i kompleksowej weryfikacji modelu ekonometrycznego wyjaśniającego zmienność średniej miesięcznej ceny Bitcoina w okresie 08.2010–05.2025, z uwzględnieniem wyzwań typowych dla rynków kryptowalut: ekstremalnej niestacjonarności szeregów, heteroskedastyczności, autokorelacji reszt oraz wpływu czynników fundamentalnych i behawioralnych.

**Rozwiązanie**
  * Przeprowadzono kompleksową diagnostykę 8 zmiennych objaśniających (m.in.: wolumen, trudność wydobycia, podaż BTC, cena energii, inflacja USA)
  * Zastosowano testy stacjonarności ADF i KPSS dla wszystkich szeregów czasowych
  * Wyeliminowano niestacjonarność poprzez logarytmowanie i różnicowanie szeregów (stopień integracji I(1) i I(2))
  * Dobrano zmienne do modelu metodą Hellwiga oraz regresją krokową wsteczną (stepwise)
  * Zbudowano model regresji liniowej na danych różnicowanych z podziałem 80/20 na zbiór uczący i testowy
  * Skorygowano autokorelację reszt procedurą Cochrane-Orcutta
  * Przeprowadzono pełną weryfikację diagnostyczną: normalność reszt (Shapiro-Wilk, Jarque-Bera), heteroskedastyczność (Goldfeld-Quandt, Breusch-Pagan, White), stabilność parametrów (test Chowa, RESET)
  * Zbadano efekty katalizy i koincydencji między zmiennymi objaśniającymi
  * Przeprowadzono prognozę ex-post z obliczeniem błędów RMSE, MAE, MAPE

**Wynik**
  * Ostateczny model wyjaśnia 11,1% wariancji ceny BTC , co jest wynikiem satysfakcjonującym dla danych giełdowych o ekstremalnej zmienności
  * Zidentyfikowano 2 istotne statystycznie predyktory: Google Trends i trudność wydobycia 
  * Ustalono elastyczność cenową: wzrost zainteresowania o 1% → wzrost ceny o 0,19%; wzrost trudności wydobycia o 1% → wzrost ceny o 0,17%
  * Skutecznie usunięto autokorelację reszt, na co wskazała poprawiona statystyka Durbin-Watsona 
  * Potwierdzono stabilność parametrów modelu i poprawność postaci analitycznej
  * Osiągnięto błąd prognozy MAPE = 24.27% – relatywnie dobry wynik dla tak nieprzewidywalnego aktywa
  * Wykazano, że czynniki behawioralne (Google Trends) mają istotniejszy wpływ na cenę niż tradycyjne wskaźniki makroekonomiczne
  * Projekt zrealizowano w zespole 2-osobowym z pełną dokumentacją w PDF

