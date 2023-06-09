<CsoundSynthesizer>
<CsOptions>

; Autor: Carlos Arturo Guerra Parra
; Título: "Salvete, quicumque estis..."
; Fecha: Mayo de 2012

; La obra no está pensada para ser ejecutada en vivo, ni en 2012 cuando se creó, ni hoy,
; en 2023, que se revisa y refactoriza. Existen partes en las que la demanda de velocidad es 
; demasiado grande y se producen 'Buffer underrun in real-time audio output'.
; Aún así, puede ser útil la ejecución en vivo para debugear el programa.
; Elegir aquí si se quiere obtener un archivo de audio o una ejecución en vivo:

;-o salvete.wav -W ; Crea un archivo WAV
-odac ; Ejecución en vivo
</CsOptions>
<CsInstruments>
 
/* El Sample Rate se ha escogido de 44100 Hz para facilitar la ejecución
de los audios de Golden Record, que tienen precisamente esta magnitud */
sr = 44100 
ksmps = 32 
nchnls = 2 ; Toda la composición está pensada para ser ejecutada por dos canales, incluso la espacialización en 3D.
0dbfs = 1 ; No modificar esto, ya que todo el código supone que la intensidad está entre -1 y 1

/* Aquí se establece una semilla para la generación de números aleatorios.
En esta composición la aleatoriedad juega un papel muy importante.
Probar a modificar este entero para obtener diferentes versiones */
seed 876 

/* Conjunto de tablas utilizadas por diferentes opcodes. Nótese que son llamadas
por los opcodes por su número (1, 2, 3 y 4) y no por su nombre ("gisine", etc.) */
gisine ftgen 1, 0, 2^10, 10, 1
girich ftgen 2, 0, 2^16, 10, 1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8
gipunto ftgen 3, 0, 5, 2, 0, 0, 1, 1
gicuadr ftgen 4, 0, 4, 2, 0, 0, 1, 1

/* Variables globales para reverbs */
gasig1 init 0
gasig2 init 0
gasig3 init 0
gasig4 init 0

instr 1 ; instrumento director
    ; loop de notas de instrumento 2

    ;; PRIMERA PARTE
    ; reverb
    event_i "i", 99, 0, 139, .8, .5

    ; Efecto de superposición de notas de FM repetidas a modo de delay.
    ; Estos eventos de instr 3 se producen a lo largo de toda la primera parte.
    ; Por simplicidad aparecen todos al principio de la partitura
    event_i "i", 3, 0, 1, 70, .05, 90, 0
    event_i "i", 3, 0.05, 2, 70, .05, -90, 0
    event_i "i", 3, 0.1, 3, 70, .05, 90, 0
    event_i "i", 3, 0.15, 4, 70, .05, -90, 0
    event_i "i", 3, 0.2, 5, 70, .05, 90, 0
    event_i "i", 3, 0, .25, 70, .05, 90, 0
    event_i "i", 3, 0.3, 2, 70, .05, -90, 0
    event_i "i", 3, 0.35, 3, 70, .05, 90, 0
    event_i "i", 3, 0.40, 4, 70, .05, -90, 0
    event_i "i", 3, 0.45, 5, 70, .05, 90, 0

    event_i "i", 3, 12, 1, 70, .07, 90, 0
    event_i "i", 3, 12.05, 2, 70, .07, 90, 0
    event_i "i", 3, 12.1, 3, 70, .07, 90, 0
    event_i "i", 3, 12.15, 4, 70, .07, 90, 0
    event_i "i", 3, 12.2, 5, 70, .07, 90, 0
    event_i "i", 3, 12.25, 6, 70, .07, 90, 0
    event_i "i", 3, 12.3, 7, 70, .07, 90, 0
    event_i "i", 3, 12.35, 8, 70, .07, 90, 0
    event_i "i", 3, 12.40, 9, 70, .07, 90, 0
    event_i "i", 3, 12.45, 10, 70, .07, 90, 0

    event_i "i", 3, 17, 1, 70, .07, 90, 0
    event_i "i", 3, 17.05, 2, 70, .07, 90, 0
    event_i "i", 3, 17.1, 3, 70, .07, 90, 0
    event_i "i", 3, 17.15, 4, 70, .07, 90, 0
    event_i "i", 3, 17.2, 5, 70, .07, 90, 0
    event_i "i", 3, 17.25, 6, 70, .07, 90, 0
    event_i "i", 3, 17.3, 7, 70, .07, 90, 0
    event_i "i", 3, 17.35, 8, 70, .07, 90, 0
    event_i "i", 3, 17.40, 9, 70, .07, 90, 0
    event_i "i", 3, 17.45, 10, 70, .07, 90, 0

    event_i "i", 3, 22, 1, 70, .05, -90, 40
    event_i "i", 3, 22.05, 2, 70, .05, -90, 40
    event_i "i", 3, 22.1, 3, 70, .05, -90, 40
    event_i "i", 3, 22.15, 4, 70, .05, -90, 40
    event_i "i", 3, 22.2, 5, 70, .05, -90, 40

    event_i "i", 3, 25, 1, 70, .05, 90, 40
    event_i "i", 3, 25.05, 2, 70, .05, 90, 40
    event_i "i", 3, 25.1, 3, 70, .05, 90, 40
    event_i "i", 3, 25.15, 4, 70, .05, 90, 40
    event_i "i", 3, 25.2, 5, 70, .05, 90, 40

    event_i "i", 3, 35, 20, 70, .05, 0, 40
    event_i "i", 3, 40.05, 10, 70, .05, 0, -40
    event_i "i", 3, 42.1, 7, 70, .05, 90, 40
    event_i "i", 3, 48.15, 4, 70, .05, -90, 40
    event_i "i", 3, 50.2, 10, 70, .05, 0, 0

    event_i "i", 3, 65, 1, 70, .05, 90, 0
    event_i "i", 3, 65.05, 2, 70, .05, -90, 0
    event_i "i", 3, 65.1, 3, 70, .05, 90, 0
    event_i "i", 3, 65.15, 4, 70, .05, -90, 0
    event_i "i", 3, 65.2, 5, 70, .05, 90, 0
    event_i "i", 3, 65, .25, 70, .05, 90, 0
    event_i "i", 3, 65.3, 2, 70, .05, -90, 0
    event_i "i", 3, 65.35, 3, 70, .05, 90, 0
    event_i "i", 3, 65.40, 4, 70, .05, -90, 0
    event_i "i", 3, 65.45, 5, 70, .05, 90, 0

    event_i "i", 3, 69, 20, 70, .05, 0, 0
    event_i "i", 3, 69.05, 2, 70, .05, 0, 0
    event_i "i", 3, 69.1, 3, 70, .05, 0, 0
    event_i "i", 3, 69.15, 4, 70, .05, 0, 0
    event_i "i", 3, 69.2, 5, 70, .05, 0, 0
    event_i "i", 3, 69, .25, 70, .05, 0, 0
    event_i "i", 3, 69.3, 2, 70, .05, 0, 0
    event_i "i", 3, 69.35, 3, 70, .05, 0, 0
    event_i "i", 3, 69.40, 4, 70, .05, 0, 0
    event_i "i", 3, 69.45, 5, 70, .05, 0, 0

    ; Pulsos que saltan de frecuencia rodeando la cabeza
    event_i "i", 9, 0, 130, 1000, 900, .1, 70
    event_i "i", 9, 15, 115, 200, 100, .1, 70
    event_i "i", 9, 25, 105, 4000, 500, .15, 80

    ; Fondo de sinusoides volantes 
    iloop_i = 0
    idur = 130
    event_i "i", 2, 0, idur, 1, 50, 100
    loop1:
        istart random 0, idur
        ialarg = idur - istart
        iamp random .1, .3
        ifreq random 100, 1000
        iiter = 30
        ;i2 start dur gain freq %t_inharm
        event_i "i", 2, istart, ialarg, iamp, ifreq, 100
    loop_lt iloop_i, 1, iiter, loop1

    ; Final del Fondo de sinusoides volantes 
    event_i "i", 2, 130, .3, .5, 200, 100
    event_i "i", 2, 130, .5, .7, 100, 100
    event_i "i", 2, 130, .4, .6, 150, 100
    event_i "i", 2, 130, .6, .5, 125, 100
    event_i "i", 2, 130, .2, .4, 50, 100
    event_i "i", 2, 130, .7, .4, 90, 100


    ;; SEGUNDA PARTE

    ; reverb
    event_i "i", 99, 130, 145, .8, 1

    ; Hilo de ruido filtrado volante
    event_i "i", 6, 130, 70, 300, 400, .2
    event_i "i", 6, 130, 70, 300, 1000, .3
    event_i "i", 6, 130, 200, 75, 200, .18

    ; Ruido antes del primer saludo:
    event_i "i", 7, 151.85, .15, 90, 0
    ; Algunos saludos:
    event_i "i", 8, 152, 10, 90, 0, 53, 2, 1 ; Inglés 53
    event_i "i", 8, 168, 10, -90, 0, 13, 2, 1; Español 13
    event_i "i", 8, 187, 10, 0, 90, 10, 2, 1; Francés 10
    event_i "i", 8, 178, 10, 0, 0, 50, 2.6, 1; Checo 50
    event_i "i", 8, 200, 20, 0, 45, 18, 2.4, 1; Latín 18
    event_i "i", 8, 195, 10, -45, 0, 12, 2, 1; Hebreo 12

    ; loop de saludos. Iran aumentando su densidad y después su velocidad. Total 40s
    iloop2_i = 1
    idur = 80
    imin = 162
    idenom = 30 ; determina la densidad inicial de disparo de samples saludos
    ialargada = idenom
    ipitch = 1
    loop2:
        istart = imin + idur - (idur / idenom) * ialargada
        idenom = idenom + 1
        iduracion = idur + imin - istart; pasarle información al instrumento 8 para que corten bruscamente al final de idur
        iAz random 0, 180
        iElev random 0, 360
        ifile random 1, 52
        iamp random .6, .8
        ipitch = ipitch * 1.012
        iIter = 200 ; número de samples que se disparan
        event_i "i", 8, istart, iduracion, iAz, iElev, ifile, iamp, ipitch
    loop_le iloop2_i, 1, iIter, loop2

    ; ruidos de campana
    iloop3_i = 1
    idurtotal = 127
    iIter = 20
    iinitotal = 154
    iini = iinitotal
    iampMax = .8
    iampMin = .4
    loop3:
        istart random iini, iini + idurtotal
        idur random 4, 20
        ifreq random 160, 3000
        iAz random 0, 360
        iElev random 90, -90
        ifactor = (idurtotal - istart) / (iinitotal + idurtotal)
        iamp random iampMin * ifactor, iampMax * ifactor
        event_i "i", 5, istart, idur, ifreq, iAz, iElev, iamp
    loop_le iloop3_i, 1, iIter, loop3

    ; ruidos de campana (2)
    iloop4_i = 1
    idurtotal = 30
    iIter = 25
    iinitotal = 242
    iini = iinitotal
    iampMax = .4
    iampMin = .2
    loop4:
        istart random iini, iini + idurtotal
        idur random 8, 30
        ifreq random 160, 3000
        iAz random 0, 360
        iElev random 90, -90
        ifactor = (idurtotal - istart) / (iinitotal + idurtotal)
        iamp random iampMin * ifactor, iampMax * ifactor
        event_i "i", 5, istart, idur, ifreq, iAz, iElev, iamp
    loop_le iloop4_i, 1, iIter, loop4

    ; ruidos de campana (3)
    iloop5_i = 1
    idurtotal = 60
    iIter = 12
    iinitotal = 272
    iini = iinitotal
    iampMax = .2
    iampMin = .08
    loop5:
        istart random iini, iini + idurtotal
        idur random 15, 30
        ifreq random 80, 3000
        iAz random 0, 360
        iElev random 45, -45
        iamp random iampMin, iampMax
        event_i "i", 5, istart, idur, ifreq, iAz, iElev, iamp
    loop_le iloop5_i, 1, iIter, loop5
endin

/**************************************************************************************** */
/**************************************************************************************** */
/**************************************************************************************** */

instr 2 ; 8 armónicos vienen y se colocan desde una frecuencia aleatoria hasta su sitio

igain = p4 ; ganancia final de la nota sintetizada
ifreq = p5 ; frecuencia fundamental de la nota
itih = p3 * p6 / 100 ; p6 porcentaje de tiempo de inarmonicidad. Se convierte a tiempo en segundos.
; frecuencias mínimas y máximas de origen de los armónicos
ifmin = 30
ifmax = 5000

; frecuencias de los parciales armonicos. Frecuencias finales
ifh1 = ifreq
ifh2 = ifreq * 2
ifh3 = ifreq * 3
ifh4 = ifreq * 4
ifh5 = ifreq * 5
ifh6 = ifreq * 6
ifh7 = ifreq * 7
ifh8 = ifreq * 8

; Generación de frecuencias aleatorias de origen de los armónicos entre ifmin e ifmax

ifhi1 linrand ifmax - ifmin
ifhi2 linrand ifmax - ifmin
ifhi3 linrand ifmax - ifmin
ifhi4 linrand ifmax - ifmin
ifhi5 linrand ifmax - ifmin
ifhi6 linrand ifmax - ifmin
ifhi7 linrand ifmax - ifmin
ifhi8 linrand ifmax - ifmin

ifhi1 = ifhi1 + ifmin
ifhi2 = ifhi2 + ifmin
ifhi3 = ifhi3 + ifmin
ifhi4 = ifhi4 + ifmin
ifhi5 = ifhi5 + ifmin
ifhi6 = ifhi6 + ifmin
ifhi7 = ifhi7 + ifmin
ifhi8 = ifhi8 + ifmin

; Panorámica stereo aleatoria para cada armónico
ipan1 linrand 1
ipan2 linrand 1
ipan3 linrand 1
ipan4 linrand 1
ipan5 linrand 1
ipan6 linrand 1
ipan7 linrand 1
ipan8 linrand 1

; Trazamos las líneas de frecuencia desde el origen hasta el fin.

kfreq1   expseg ifhi1, itih, ifh1, p3-itih, ifh1
kfreq2   expseg ifhi2, itih, ifh2, p3-itih, ifh2
kfreq3   expseg ifhi3, itih, ifh3, p3-itih, ifh3
kfreq4   expseg ifhi4, itih, ifh4, p3-itih, ifh4
kfreq5   expseg ifhi5, itih, ifh5, p3-itih, ifh5
kfreq6   expseg ifhi6, itih, ifh6, p3-itih, ifh6
kfreq7   expseg ifhi7, itih, ifh7, p3-itih, ifh7
kfreq8   expseg ifhi8, itih, ifh8, p3-itih, ifh8

;ahora hacemos unos movimientos aleatorios de las lineas de frecuencia
iindexvelal = 10 ;indice de velocidad de cambio
icpsal1    linrand iindexvelal
icpsal2    linrand iindexvelal
icpsal3    linrand iindexvelal
icpsal4    linrand iindexvelal
icpsal5    linrand iindexvelal
icpsal6    linrand iindexvelal
icpsal7    linrand iindexvelal
icpsal8    linrand iindexvelal
kenval1    randi 1, icpsal1, 34 ;unas con randi: usan interpolacion
kenval2    randi 1, icpsal2, 56
kenval3    randi 1, icpsal3, 87
kenval4    randi 1, icpsal4, 11
kenval5    randi 1, icpsal5, 22
kenval6    randi 1, icpsal6, 98
kenval7    randi 1, icpsal7, 46
kenval8    randi 1, icpsal8, 69

;kenv_al   expseg 1, itih*1/2, 0.001, itih*1/2*1/3, 0.0003, itih*1/2*2/3, 0.0001, p3-itih, 0.0001
;kenv_al   expseg 0.5, itih*1/2, 0.001, itih*1/2*1/3, 0.0003, itih*1/2*2/3, 0.0001, p3-itih, 0.0001

kenv_al   expseg 0.001, itih*1/2, 0.3, itih*1/2*1/3, 0.1, itih*1/2*2/3 - 0.5, 0.5, 0.5, 1.5, p3-itih, 0.0001
;kenv_al = 0.05
;producimos los armonicos sinusoides
iindexenv = 15000 ; el índice de grado de vaiven de los armónicos
ah1    oscil 1, kfreq1+kenval1*iindexenv*kenv_al, 1
ah2    oscil 1/2, kfreq2+kenval2*iindexenv*kenv_al, 1
ah3    oscil 1/3, kfreq3+kenval3*iindexenv*kenv_al, 1
ah4    oscil 1/4, kfreq4+kenval4*iindexenv*kenv_al, 1
ah5    oscil 1/5, kfreq5+kenval5*iindexenv*kenv_al, 1
ah6    oscil 1/6, kfreq6+kenval6*iindexenv*kenv_al, 1
ah7    oscil 1/7, kfreq7+kenval7*iindexenv*kenv_al, 1
ah8    oscil 1/8, kfreq8+kenval8*iindexenv*kenv_al, 1

/* Esta línea se procede acomentarla porque parece venir de un "slider" externo, y se inicializa kvolumen a 0.7,
ya que sin el slider su valor es siempre 0, e instr 2 no tendría ningún efecto */
;kvolumen invalue "slider1"
kvolumen = 0.7

; Sumamos todo para la salida del instrumento.
asig1 = (ah1*ipan1+ah2*ipan2+ah3*ipan3+ah4*ipan4+ah5*ipan5+ah6*ipan5+ah7*ipan7+ah8*ipan8)*igain*kvolumen*0.1

asig2 = (ah1*(1-ipan1)+ah2*(1-ipan2)+ah3*(1-ipan3)+ah4*(1-ipan4)+ah5*(1-ipan5)+ah6*(1-ipan6)+ah7*(1-ipan7)+ah8*(1-ipan8))*igain*kvolumen*0.1

; envolvemos la señal
asig1   linen asig1, p3/100, p3, 0.1 
asig2   linen asig2, p3/100, p3, 0.1 
        ;outs asig1,asig2

; La salida de instr 2 va variables globales de reverb.       
gasig1 = gasig1 + asig1
gasig2 = gasig2 + asig2
endin

/**************************************************************************************** */
/**************************************************************************************** */
/**************************************************************************************** */


instr 3 ; FM. Produce pulsos de FM y los localiza binuralmente
;Onda moduladora
;Amplitud:
kamp1   =   1500
kfreq1  =   19
;Osciladores:
aMod1   poscil  kamp1, kfreq1 , 2
        ;;Onda portadora        
;Amplitud:
kamp    =   p5
;Frecuencia:
kfreq   =   p4
;Oscilador:        
aCar    poscil  kamp, kfreq+aMod1, 2
kenv    transeg 0, 0.01, -2, 1, p3-0.1, -2, 0
aCar    =   aCar*kenv

;sonido a reverb (instr 99 o 999)
gasig1 = gasig1 + aCar*0.55
gasig2 = gasig2 + aCar*0.55

;Sonido binaural
kAz     = p6
kElev   = p7
aleft, aright  hrtfmove aCar, kAz, kElev, "hrtf-44100-left.dat","hrtf-44100-right.dat"
        outs aleft*0.5, aright*0.5
endin

/**************************************************************************************** */
/**************************************************************************************** */
/**************************************************************************************** */


instr 5 ;golpes de campana reiterados que aceleran y caen.

iamp        =   p7

kfreq   expon   10, p3, 5000
asound  randh   0.2, kfreq
kfreqr  =   p4
kAz     =   p5
kElev   =   p6
afiltered   reson   asound, kfreqr, 0.2
afiltered   balance afiltered, asound
afiltered   =       afiltered*iamp
kenv        transeg 0, 0.01, -2, 1, p3-0.01-0.5, -4, 0, 0.5, 0, 0
aleft, aright  hrtfmove2 afiltered*kenv, kAz, kElev, "hrtf-44100-left.dat","hrtf-44100-right.dat"
gasig3  = gasig3 + afiltered
gasig4  = gasig4 + afiltered


outs aleft, aright
endin

/**************************************************************************************** */
/**************************************************************************************** */
/**************************************************************************************** */

instr 6 ;ruido filtrado
irango      =   p4
ifreqIni    =   p5
iamp        =   p6

anoise  noise   iamp, 0.7
kfcamb  random  1/3, 1/7
kfreq   randi irango, kfcamb, 314
kfreq   =   ifreqIni + kfreq
afilt   reson   anoise, kfreq, kfreq/20 
afilt   balance afilt, anoise

;envolvente:
;afilt   linen   afilt, 20, p3, 20
kenv    expseg  0.0001, 10, 1, p3-20, 1, 10, 0.0001
afilt   =   afilt * kenv

kAz     randi   360, 1/6, 543
kElev   randi   60, 1/6, 765
aleft, aright hrtfmove2 afilt, kAz, kElev, "hrtf-44100-left.dat","hrtf-44100-right.dat"

kamp    randi   0.2, 1, 343
kamp    =   kamp + 0.3
        outs        aleft*kamp, aright*kamp

endin


/**************************************************************************************** */
/**************************************************************************************** */
/**************************************************************************************** */

instr 7 ;ruido rosa

asig    pinkish 0.5
kAz     =   p4
kElev   =   p5
aleft, aright hrtfmove2 asig, kAz, kElev, "hrtf-44100-left.dat","hrtf-44100-right.dat"
        outs    aleft, aright

gasig1  = gasig1 + asig
gasig2  = gasig2 + asig

endin

/**************************************************************************************** */
/**************************************************************************************** */
/**************************************************************************************** */

instr 8 ; reproduce un archivo

iAz     =   p4
iElev   =   p5
iFile   =   p6
iamp    =   p7
ipitch  =   p8

asig    diskin2 iFile, ipitch
asig    = asig*iamp
aleft, aright hrtfmove2 asig, iAz, iElev, "hrtf-44100-left.dat","hrtf-44100-right.dat"
        outs    aleft, aright

adelay  delay   asig, 1.5

iAzD    =   iAz-180
iElevD  =   iElev-180
adelay1, adelay2 hrtfmove2 adelay, iAzD, iElevD, "hrtf-44100-left.dat","hrtf-44100-right.dat"
        outs        adelay1*0.5, adelay2*0.5

gasig1  = gasig1 + asig
gasig2  = gasig2 + asig

endin

/**************************************************************************************** */
/**************************************************************************************** */
/**************************************************************************************** */


instr 9 ; sinusoide que cambia frecuencia con randh
ifreq   =   p4
irango  =   p5
iamp    =   p6
icps    =   p7

kcps    random  1, icps
krango  linseg  0, p3, irango
kfreq   randh   krango, kcps
kfreq   = kfreq + ifreq
kamp    expseg  0.01, p3-0.2, iamp, 0.2, 0.001
asig    poscil  kamp, kfreq, 4
iElev   =   0
kAz     line        -90,p3,3600
aleft, aright hrtfmove2 asig, kAz, iElev, "hrtf-44100-left.dat","hrtf-44100-right.dat"
        outs    aleft, aright
endin

/**************************************************************************************** */
/**************************************************************************************** */
/**************************************************************************************** */

instr 99 ;reverberación

irm_size = p4
idamp = p5
asig1, asig2    freeverb gasig1, gasig2, irm_size, idamp ;0.8, 0.5
                outs asig1, asig2
gasig1 = 0
gasig2 = 0

endin

</CsInstruments>
<CsScore>

;;Dispara la partitura principal, que es un conjunto de eventos en Instr 1
i1	0 200
e 
</CsScore>
</CsoundSynthesizer>