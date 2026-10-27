# Dov'è Luca?

Chiama Luca! Sarai così fortunato da trovarlo in ufficio?

Gioco arcade in un unico file (`index.html`), senza installazioni. Si gioca da telefono o da computer.

---

## 1. Classifica condivisa (Supabase) — 10 minuti

Da fare una volta sola, prima o dopo la pubblicazione.

1. Vai su **supabase.com**, crea un account e poi **New project** (piano gratuito). Scegli una regione europea.
2. Nel menu a sinistra apri **SQL Editor**, incolla tutto il contenuto di `supabase.sql` e premi **Run**. Deve comparire "Success".
3. Apri **Project Settings → API** (o **API Keys**) e copia:
   - **Project URL** (es. `https://abcdefgh.supabase.co`)
   - la chiave **publishable** (inizia con `sb_publishable_`) oppure, nei progetti più vecchi, la chiave **anon public** (inizia con `eyJ`)
4. In `index.html`, in cima allo script, compila le due righe:
   ```js
   const SUPABASE_URL = 'https://abcdefgh.supabase.co';
   const SUPABASE_KEY = 'sb_publishable_...';
   ```

> **Attenzione:** non usare mai la chiave **secret** / **service_role**. Quella dà accesso completo al database e finirebbe pubblica su GitHub.

Senza questi due valori il gioco funziona lo stesso, con classifica salvata solo sul singolo dispositivo.

---

## 2. Pubblicazione su GitHub Pages — 5 minuti, senza usare il terminale

1. Accedi a **github.com** (crea un account se non lo hai).
2. In alto a destra: **+ → New repository**.
   - Nome: ad esempio `dove-e-luca` (sarà parte del link)
   - Visibilità: **Public** (necessaria per Pages sul piano gratuito)
   - Lascia vuote le altre opzioni
   - Premi **Create repository**
3. Nella pagina del repository: **Add file → Upload files**. Trascina `index.html`, `README.md` e `supabase.sql`, poi **Commit changes**.
4. Vai su **Settings → Pages**.
   - **Source:** Deploy from a branch
   - **Branch:** `main`, cartella `/ (root)` → **Save**
5. Dopo 1–2 minuti, ricarica la pagina: in alto compare il link
   `https://<tuo-utente>.github.io/dove-e-luca/`
   Quello è il link da mandare in ufficio.

---

## 3. Aggiornare il gioco

- **Da GitHub:** apri `index.html` nel repository, clicca sull'icona della matita (**Edit**), modifica, **Commit changes**. Il sito si aggiorna in circa un minuto.
- **Sostituendo il file:** **Add file → Upload files**, trascina il nuovo `index.html`, **Commit changes**.

Se dopo un aggiornamento vedi la versione vecchia, ricarica forzando la cache (Ctrl+Shift+R, o Cmd+Shift+R su Mac).

---

## Gestione classifica

- Ogni giocatore compare una sola volta con il suo miglior punteggio. Nomi uguali, anche con maiuscole diverse, contano come la stessa persona.
- Per cancellare un punteggio finto: Supabase → **Table Editor → scores**, seleziona la riga ed eliminala. In alternativa, da SQL Editor: `delete from public.scores where id = 123;`
- Per azzerare tutto: `truncate public.scores;`
- I progetti gratuiti Supabase vanno in pausa dopo un periodo senza attività. Se la classifica smette di caricare, riattiva il progetto dalla dashboard.

---

## Personalizzare

In cima allo script di `index.html`:

- `CLUES`: gli indizi, divisi per luogo e difficoltà (`easy`, `hard`, `expert`) più quelli dell'ufficio
- `BOSS_LINES`, `LIAR_LINE`, `OFFICE_LIES`: le frasi di Luca
- `T`: il bilanciamento (vite, livelli, velocità, disturbo sulla linea, frequenza e valore del bonus ufficio)

Regola per gli indizi: mai nominare il luogo o un suo simbolo ovvio, e ogni indizio deve funzionare per un solo luogo.
