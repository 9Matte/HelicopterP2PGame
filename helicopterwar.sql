--
-- Database: `helicopterwar`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `elicottero`
--

CREATE TABLE `elicottero` (
  `VelocitaMovimento` float NOT NULL,
  `TempoPerSparareMS` int(11) NOT NULL,
  `NomeElicottero` varchar(100) NOT NULL,
  `DescrizioneElicottero` varchar(400) NOT NULL
)

--
-- Dump dei dati per la tabella `elicottero`
--

INSERT INTO `elicottero` (`VelocitaMovimento`, `TempoPerSparareMS`, `NomeElicottero`, `DescrizioneElicottero`) VALUES
(5, 600, 'Elicottero1', 'Elicottero da guerra progettato per combattere in qualsiasi situazione. Molto efficace nello sparare, a discapito della velocità'),
(6.2, 950, 'Elicottero2', 'Elicottero da trasporto progettato per avere prestazioni medie. Buona velocità di movimento e cadenza di fuoco'),
(7.5, 1500, 'Elicottero3', 'Elicottero da ricognizione. Fa della velocità il suo punto di forza a discapito della velocità di fuoco. Ottima manovrabilità');

-- --------------------------------------------------------

--
-- Struttura della tabella `partita`
--

CREATE TABLE `partita` (
  `PartitaID` int(11) NOT NULL,
  `VincitoreID` varchar(200) NOT NULL,
  `PerdenteID` varchar(200) NOT NULL,
  `ScoreVincitore` int(11) NOT NULL,
  `ScorePerdente` int(11) NOT NULL,
  `DataPartita` date NOT NULL,
  `ElicotteroVincitore` varchar(100) NOT NULL,
  `ElicotteroPerdente` varchar(100) NOT NULL,
  `RazzoVincitore` varchar(100) NOT NULL,
  `RazzoPerdente` varchar(100) NOT NULL
)

-- --------------------------------------------------------

--
-- Struttura della tabella `persona`
--

CREATE TABLE `persona` (
  `PeerID` varchar(200) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Username` varchar(100) NOT NULL
)

--
-- Dump dei dati per la tabella `persona`
--

INSERT INTO `persona` (`PeerID`, `Email`, `Password`, `Username`) VALUES
('Ospite', 'Ospite', 'Ospite', 'Ospite');

-- --------------------------------------------------------

--
-- Struttura della tabella `razzo`
--

CREATE TABLE `razzo` (
  `NomeRazzo` varchar(100) NOT NULL,
  `VelocitaRazzo` float NOT NULL,
  `TempoDetonazioneMS` int(11) DEFAULT NULL,
  `DescrizioneRazzo` varchar(400) NOT NULL
)

--
-- Dump dei dati per la tabella `razzo`
--

INSERT INTO `razzo` (`NomeRazzo`, `VelocitaRazzo`, `TempoDetonazioneMS`, `DescrizioneRazzo`) VALUES
('Razzo1', 10, -1, 'Razzo base. Lento, ma sempre efficace nel distruggere i nemici'),
('Razzo2', 15, 1500, 'Razzo con carica esplosiva all\'interno. Ha una velocità maggiore rispetto a quello base, ha una capacità di danno maggiore. Esplode dopo 1.5 secondi'),
('Razzo3', 20, -1, 'Razzo AA molto veloce e letale'),
('Razzo4', 5, 1500, 'Arma di distruzione di massa. Considerata la madre di tutti i razzi. Esplode dopo 5 secondi. Una volta lanciata, non è possibile spararne altre. Non conosce pietà per nessuno.'),
('Razzo5', 10, -1, 'Razzo AA teleguidato. Bassa velocità di movimento per migliorare la manovrabilità generale. È possibile lanciarne solo 1 alla volta');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `elicottero`
--
ALTER TABLE `elicottero`
  ADD PRIMARY KEY (`NomeElicottero`);

--
-- Indici per le tabelle `partita`
--
ALTER TABLE `partita`
  ADD PRIMARY KEY (`PartitaID`),
  ADD KEY `VincitoreID` (`VincitoreID`),
  ADD KEY `PerdenteID` (`PerdenteID`),
  ADD KEY `ElicotteroVincitore` (`ElicotteroVincitore`),
  ADD KEY `ElicotteroPerdente` (`ElicotteroPerdente`),
  ADD KEY `RazzoVincitore` (`RazzoVincitore`),
  ADD KEY `RazzoPerdente` (`RazzoPerdente`);

--
-- Indici per le tabelle `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`PeerID`);

--
-- Indici per le tabelle `razzo`
--
ALTER TABLE `razzo`
  ADD PRIMARY KEY (`NomeRazzo`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `partita`
--
ALTER TABLE `partita`
  MODIFY `PartitaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `partita`
--
ALTER TABLE `partita`
  ADD CONSTRAINT `partita_ibfk_1` FOREIGN KEY (`VincitoreID`) REFERENCES `persona` (`PeerID`),
  ADD CONSTRAINT `partita_ibfk_2` FOREIGN KEY (`PerdenteID`) REFERENCES `persona` (`PeerID`),
  ADD CONSTRAINT `partita_ibfk_3` FOREIGN KEY (`ElicotteroVincitore`) REFERENCES `elicottero` (`NomeElicottero`),
  ADD CONSTRAINT `partita_ibfk_4` FOREIGN KEY (`ElicotteroPerdente`) REFERENCES `elicottero` (`NomeElicottero`),
  ADD CONSTRAINT `partita_ibfk_5` FOREIGN KEY (`RazzoVincitore`) REFERENCES `razzo` (`NomeRazzo`),
  ADD CONSTRAINT `partita_ibfk_6` FOREIGN KEY (`RazzoPerdente`) REFERENCES `razzo` (`NomeRazzo`);


