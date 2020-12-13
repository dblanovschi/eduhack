INSERT INTO resources (subject, grade, res_name, description, markdown)
VALUES ('informatica', 11, 'greedy',
        'Metoda Greedy este o metodă care poate fi uneori folosită în rezolvarea problemelor de următorul tip: Se dă o mulțime A. Să se determine o submulțime B a lui A astfel încât să fie îndeplinite anumite condiții – acestea depinzând de problema propriu-zisă.',
        'Metoda Greedy este o metodă care poate fi uneori folosită în rezolvarea problemelor de următorul tip: Se dă o mulțime A. Să se determine o submulțime B a lui A astfel încât să fie îndeplinite anumite condiții – acestea depinzând de problema propriu-zisă.
# Algoritm general

De regulă problema dată poate fi rezolvată prin mai multe metode, printre care și Greedy. O rezolvare generală de tip Greedy a problemei de mai sus este următoarea:

```
B ← ∅
terminat ← FALSE
Execută
Alege convenabil x ∈ A
Dacă x poate fi adăugat în B Atunci
B ← B ∪ {x}
Altfel
terminat ← TRUE
SfârșitDacă
Cât timp terminat=FALSE
```

Altfel spus, pornim de la mulțimea vidă și adăugăm în mod repetat în B elemente până când acest lucru nu mai este posibil.
# Observații

- stabilirea elementului care va fi adăugat în soluția B se face alegându-l pe cel mai bun din acel moment – este un optim local. Din acest motiv se numește Greedy (lacom);
- după adăugarea în soluția B a unui anumit element, acesta va rămâne în soluție până la final. Nu există un mecanism de revenire la un pas anterior, precum la metoda Backtracking;
- alegerea optimului local nu duce întotdeauna la cea mai bună soluție B; metoda Greedy nu este întotdeauna corectă;
- schema prezentată mai sus este vagă și nu poate fi standardizată – să avem un algoritm detaliat care să poată fi aplicat de fiecare dată;
- sunt relativ puține probleme care pot fi rezolvate cu metoda Greedy;
- complexitatea metodei este de regulă polinomială – O(nk), unde k este constant;
- folosim metoda Greedy în două situații:
  - știm sigur că rezolvarea este corectă (avem o demonstrație de natură matematică a corectitudinii);
  - nu avem decât soluții exponențiale (de tip Backtracking) și un algoritm Greedy dă o soluție nu neapărat optimă, dar acceptabilă.
- de regulă, înainte de începe alegerea elementelor convenabile din mulțimea A, elementele sale sunt ordonate după un criteriu specific, astfel încât alegerea optimului local să fie cât mai rapidă;

Există câteva probleme celebre de algoritmică ce pot fi rezolvate cu metoda Greedy:

- Problema spectacolelor
- Problema continuă a rucsacului
- Algoritmul lui Dijkstra pentru determinarea drumurilor de cost minim într-un graf
- Algoritmul lui Prim și Algoritmul lui Kruskal pentru determinarea arborelui parțial de cost minim al unui graf

# Greedy eurisitic

Există probleme pentru care avem nevoie de o rezolvare acceptabilă, chiar dacă singurele soluții demonstrate corecte sunt exponențiale, de multe ori inutile în practică.

Putem să aplicăm pentru aceste probleme metoda Greedy, obținând soluții neoptime, dar suficient de apropiate de soluția optimă pentru a fi acceptabile. Mai mult, în implementarea algoritmului se pot aplica diverse artificii la alegerea optimului local care pot duce la soluții din ce în ce mai bune, deși nu neapărat optime.

Un algoritm care obține o soluție acceptabilă, deși nu neapărat optimă, se numește Greedy euristic.

O problemă cu o soluție euristică interesantă este Săritura calului1 (enunț modificat):

Se consideră o tablă de șah cu n linii și m coloane. La o poziție dată se află un cal de șah, acesta putându-se deplasa pe tablă în modul specific acestei piese de șah (în L). Să se determine o modalitate de parcurgere a tablei de către cal, astfel încât acesta să nu treacă de două ori prin aceeași poziție.

Pentru dimensiuni mici ale tablei se poate folosi metoda Backtracking, aceasta determinând o soluție optimă. Dacă dimensiunile tablei sunt mari, metoda Backtracking nu mai poate fi folosită. Putem încerca o strategie Greedy:

- plecăm de la poziția inițială, istart jstart
- cât timp este posibil
   - alegem o poziție vecină în L cu poziția curentă în care nu am mai fost
   - marcăm poziția aleasă într-un anumit mod și o considerăm poziție curentă

Succesul algoritmului Greedy stă în alegerea poziției vecine! Desigur, nu orice metodă duce la parcurgerea completă a tablei. Neexistând un mecanism de întoarcere la o stare anterioară, când nu mai găsim poziție vecină liberă pentru poziția curentă algoritmul se încheie.

O strategie de succes este să alegem pentru poziția curentă poziția vecină cel mai greu accesibilă la pasul următor – poziția vecină cu număr minim de vecini neparcurși. Teoretic, fiecare poziție de pe tablă are 8 poziții vecini, dar unele sunt în afara tablei, altele sunt deja parcurse, astfel că putem alege dintre cei 8 vecini ai poziției curente un vecin care la rândul său are număr minim de vecini neparcurși.

Mai mult, dacă există mai mulți vecini ai poziției curente cu număr minim de vecini neparcurși, putem varia vecinul cu care vom continua: primul găsit, ultimul găsit, cel mai de sus, cel mai de jos, îl alegem aleatoriu etc., sporind șansele de a realiza o parcurgere completă a tablei.');

INSERT INTO exercises (resource_id, name, difficulty_level, link)
VALUES (1, 'rucsac', 2, 'https://www.pbinfo.ro/probleme/1340/rucsac'),
       (1, 'spectacole', 1, 'https://www.pbinfo.ro/probleme/353/spectacole');

INSERT INTO resources (subject, grade, res_name, description, markdown)
VALUES
       ('informatica', 10, 'subprograme', 'Un subprogram este o colecție de tipuri de date, variabile, instrucțiuni care îndeplinesc o anumită sarcină (calcule, citiri, afișări), atunci când este apelat de un program sau de un alt subprogram.',
        'Un subprogram este o colecție de tipuri de date, variabile, instrucțiuni care îndeplinesc o anumită sarcină (calcule, citiri, afișări), atunci când este apelat de un program sau de un alt subprogram.

Pentru a înțelege conceptul de subprogram, să considerăm două probleme:

Problema 1: Se dau două numere naturale n și m. Să se determine suma dintre oglinditul lui n și oglinditul lui m.

Până acum, pentru a rezolva această problemă, trebuia să determinăm, folosind două secvențe de program aproape identice, oglinditele celor două numere, iar apoi să facem suma. O soluție mai simplă este să construim un subprogram care determină oglinditul unui număr natural oarecare, să-l apelăm de două ori pentru a determina oglinditul lui n și al lui m, apoi să facem suma rezultatelor.

Problema 2: Se citește un tablou cu n elemente, numere întregi. Să se ordoneze crescător elementele tabloului și apoi să se afișeze.

Putem rezolva această problemă, în mai multe moduri, folosind cunoștințe pe care le avem deja. Dacă dorim să o rezolvăm folosind subprograme, vom construi trei subprograme:

- `citire` – care citește elementele vectorului
- `sortare` – care ordonează elementele vectorului
- `afisare` – care afișează elementele vectorului

Astfel, programul care rezolvă problema constă în apelul celor trei subprograme, în odinea potrivită. Am reușit să descompunem rezolvarea unei probleme complexe în mai multe subprobleme, mai simple, care pot fi rezolvate de mai multe persoane, dacă este cazul.

Constatăm că utilizarea subprogramelor are câteva avantaje:

- reutilizarea codului – după ce am scris un subprogram îl pute apela de oricâte ori este nevoie;
- modularizarea programelor – subprogramele ne permit să împărțim problema dată în mai multe subprobleme, mai simple;
- reducerea numărului de erori care pot să apară în scrierea unui program
- depistarea cu ușurință a erorilor – fiecare subprogram va fi verificat la crearea sa, apoi verificăm modul în care apelăm subprogramele

Subprogramele pot fi de două tipuri:

- funcții – subprograme care determină un anumit rezultat, o anumită valoare, pornind de la anumite date de intrare. Spunem că valoarea este returnată de către funcție, iar aceasta va fi apelată ca operand într-o expresie, valoarea operandului în expresie fiind de fapt valoarea rezultatului funcției.
- proceduri – subprograme care se folosesc într-o instrucțiune de sine stătătoare, nu într-o expresie. Ele îndeplinesc o sarcină, au un efect și nu returnează un rezultat. De exemplu, citirea unor variabile, afișarea unor valori, transformarea unor date etc.

În limbajul C/C++, există doar subprograme de tip funcție. Pentru proceduri se folosește o formă particulară a funcțiilor.

# Exemplu

Considerăm problema: Se dau două numere naturale n și m. Să se determine suma dintre oglinditul lui n și oglinditul lui m.

Programul următor rezolvă problema de mai sus.

```cpp
#include <iostream>
using namespace std;

int ogl(int x)
{
    int r = 0;
    do
    {
        r = 10 * r + x % 10;
        x /= 10;
    }
    while(x != 0);
    return r;
}

int main(){
    int n , m;
    cin >> n >> m;
    cout << ogl(n) + ogl(m);
    return 0;
}
```

Funcția care calculează oglinditul unui număr este `int ogl(int x)`.

- funcția are un antet: `int ogl(int x)`, din care deducem că:
  - funcția se numește ogl;
  - funcția are un parametru, `x`, de tip `int`. Parametrul este important, deoarece prin el se precizează care este numărul pentru care se determină oglinditul. Vom vedea mai târziu că o funcție poate avea mai mulți parametri. Parametrii care apar în antetul funcției se numesc parametri formali;
  - funcția are un anumit tip, aici `int`, care precizează care este tipul rezultatului;
- funcția are un bloc de instrucțiuni, corpul funcției, delimitat de acolade `{}`, care precizează operațiile prin care se obține rezultatul. Mai mult:
  - corpul funcției are propriile variabile (aici r). Aceste variabile se numesc variabile locale;
  - în corpul funcției, parametrul se comportă ca o variabilă locală. NU putem avea o variabilă locală cu același identificator ca parametrul;
  - în corpul funcției nu se cunosc valorile parametrilor formali. Funcția trebuie să determine rezultatul corect indiferent de valoarea lor;
  - rezultatul determinat în cadrul funcției este întors în programul apelant prin instrucțiunea return. Rezultatul este calculat în mod obișnuit în variabila r. Prin instrucțiunea return r;, valoarea curentă a variabilei r este returnată în programul apelant;
- în funcția main găsim apelul funcției `ogl`:
  - apelul funcției se face într-o expresie: `cout << ogl(n) + ogl(m);`. Pentru operația de adunare, operanzii vor fi rezultatele apelurilor celor două funcții;

# Exemplu 2
Considerăm problema: Se citește un tablou cu elemente numere întregi. Să se ordoneze crescător elementele tabloului și apoi să se afișeze.

O rezolvare C/C++ care folosește funcții este următoarea:

```cpp
#include <iostream>
using namespace std;

void citire(int &n, int x[])
{
    cin >> n;
    for(int i = 0; i < n; i++)
        cin >> x[i];
}

void sortare(int n, int x[])
{
    bool sortat = false;
    while(!sortat)
    {
        sortat = true;
        for(int i = 0; i < n - 1; i++)
            if(x[i] > x[i+1])
            {
                int aux = x[i];
                x[i] = x[i+1];
                x[i+1] = aux;
                sortat = false;
            }
    }
}

void afisare(int n, int x[])
{
    for(int i = 0; i < n; i++)
        cout << x[i] << " ";
}

int main(){
    int k, v[1005];
    citire(k, v);
    sortare(k, v);
    afisare(k, v);
    return 0;
}
```

Față de cele de mai sus, putem observa următoarele:

- funcțiile citire, sortare și afisare nu returnează valori și au un tip al rezultatului special, void. Tipul void este un tip de date care nu conține valori și poate fi folosit tocmai în asemenea situații. Am putea spune că sunt de tip procedură;
- apelul acestor funcții se face în instrucțiuni de sine stătătoare;
- funcțiile au câte doi parametri, numărul de elemente ale tabloului și tabloul propriu zis. Pentru parametrul formal de tip tablou nu trebuie să fie precizată dimensiunea declarată a tabloului;
- numele parametrilor actuali nu trebuie să fie aceiași cu cei ai parametrilor formali. Trebuie însă să corespundă numărul lor, tipul lor și ordinea;
- parametrul actual de tip tablou nu conține []:
  - dacă am fi avut apelul `citire(k, v[]);` am fi obținut o eroare de sintaxă, sintagma v[] neavând înțeles in acest context;
  - dacă am fi avut apelul `citire(k, v[k]);` am fi obținut de asemenea eroare de compilare, `v[k]` fiind elementul de indice k din tabloul v, deci o variabilă de tip int, nu tablou;
- observați prezența caracterului `&` înaintea parametrului formal `n` din antetul funcției citire. Acesta transformă parametrul formal într-un alias al parametrului actual, iar modificările făcute asupra parametrului formal `n` au loc de fapt asupra parametrului actual `k` din `main`;
');

INSERT INTO exercises (resource_id, name, difficulty_level, link)
VALUES (2, 'FactorialF', 1, 'https://www.pbinfo.ro/probleme/896/factorialf'),
       (2, 'SumCifF', 1, 'https://www.pbinfo.ro/probleme/897/sumciff'),
       (2, 'NrMaxim', 2, 'https://www.pbinfo.ro/probleme/1509/nrmaxim'),
       (2, 'SumFactCif', 2, 'https://www.pbinfo.ro/probleme/898/sumfactcif');