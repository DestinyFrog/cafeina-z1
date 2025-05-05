const a = [
    ['atomic_number','oficial_name','atomic_radius','category','atomic_mass','eletronegativity','`period`','family','symbol','fase','xpos','ypos','layers','electronic_configuration','oxidation_state','name_meaning','discovery_year','discovery','another_names'],
    [1, "hidrogênio", 53, "hidrogênio", 1.00794, 2.1, 1, 1, "H", "G", 1, 1, [1], "1s1", [1], 1766, ["Henry Cavendish"], [], null],
    [2, "hélio", 31, "gás nobre", 4.002602, null, 1, 18, "He", "G", 18, 1, [2], "1s2", [], 1868, ["Jules Janssen", "Norman Lockyer"], [], null],
    [3, "lítio", 167, "metal alcalino", 6.941, 0.98, 2, 1, "Li", "S", 1, 2, [2, 1], "1s2 2s1", [1], 1817, ["Johan August Arfwedson"], [], null],
    [4, "berílio", 112, "metal alcalino terroso", 9.012182, 1.57, 2, 2, "Be", "S", 2, 2, [2, 2], "1s2 2s2", [2], 1797, ["Louis Nicolas Vauquelin"], [], null],
    [5, "boro", 87, "semimetal", 10.811, 2.04, 2, 13, "B", "S", 13, 2, [2, 3], "1s2 2s2 2p1", [], 1808, ["Louis Jacques Thénard", "Humphry Davy", "Louis Joseph Gay-Lussac"], [], null],
    [6, "carbono", 67, "ametal", 12.0107, 2.55, 2, 14, "C", "S", 14, 2, [2, 4], "1s2 2s2 2p2", [-2], 1779, ["Antoine Lavoisier"], [], null],
    [7, "nitrogênio", 56, "ametal", 14.0067, 3.04, 2, 15, "N", "G", 15, 2, [2, 5], "1s2 2s2 2p3", [-2], 1772, ["Daniel Rutherford"], ["azoto"], null],
    [8, "oxigênio", 48, "ametal", 15.9994, 3.44, 2, 16, "O", "G", 16, 2, [2, 6], "1s2 2s2 2p4", [-2], 1774, ["Joseph Priestley", "Antoine Lavoisier", "Carl Wilhelm Scheele"], [], null],
    [9, "flúor", 42, "halogênio", 18.9984032, 3.98, 2, 17, "F", "G", 17, 2, [2, 7], "1s2 2s2 2p5", [-1], 1886, ["Henri Moissan"], [], null],
    [10, "neônio", 38, "gás nobre", 20.1797, null, 2, 18, "Ne", "G", 18, 2, [2, 8], "1s2 2s2 2p6", [], 1898, ["William Ramsay", "Morris William Travers"], [], null],
    [11, "sódio", 190, "metal alcalino", 22.98977, 0.93, 3, 1, "Na", "S", 1, 3, [2, 8, 1], "1s2 2s2 2p6 3s1", [1], 1807, ["Humphry Davy"], [], 'natrium'],
    [12, "magnésio", 145, "metal alcalino terroso", 24.305, 1.31, 3, 2, "Mg", "S", 2, 3, [2, 8, 2], "1s2 2s2 2p6 3s2", [2], 1755, ["Humphry Davy", "Joseph Black"], [], null],
    [13, "alumínio", 118, "outros metais", 26.981538, 1.61, 3, 13, "Al", "S", 13, 3, [2, 8, 3], "1s2 2s2 2p6 3s2 3p1", [3], 1825, ["Hans Christian Ørsted"], [], null],
    [14, "silício", 111, "semimetal", 28.0855, 1.9, 3, 14, "Si", "S", 14, 3, [2, 8, 4], "1s2 2s2 2p6 3s2 3p2", [4], 1824, ["Jöns Jacob Berzelius", "Antoine Lavoisier"], [], null],
    [15, "fósforo", 98, "ametal", 30.973761, 2.19, 3, 15, "P", "S", 15, 3, [2, 8, 5], "1s2 2s2 2p6 3s2 3p3", [], 1669, ["Henning Brand"], [], null],
    [16, "enxofre", 88, "ametal", 32.065, 2.58, 3, 16, "S", "S", 16, 3, [2, 8, 6], "1s2 2s2 2p6 3s2 3p4", [-2], 1869, ["Antoine Lavoisier"], [], null],
    [17, "cloro", 79, "halogênio", 35.453, 3.16, 3, 17, "Cl", "G", 17, 3, [2, 8, 7], "1s2 2s2 2p6 3s2 3p5", [-1], 1774, ["Carl Wilhelm Scheele"], [], null],
    [18, "argônio", 71, "gás nobre", 39.948, null, 3, 18, "Ar", "G", 18, 3, [2, 8, 8], "1s2 2s2 2p6 3s2 3p6", [], 1894, ["William Ramsay", "John William Strutt"], [], null],
    [19, "potássio", 243, "metal alcalino", 39.0983, 0.82, 4, 1, "K", "S", 1, 4, [2, 8, 8, 1], "1s2 2s2 2p6 3s2 3p6 4s1", [1], 1807, ["Humphry Davy"], [], 'kalium'],
    [20, "cálcio", 194, "metal alcalino terroso", 40.078, 1, 4, 2, "Ca", "S", 2, 4, [2, 8, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2", [2], 1808, ["Humphry Davy"], [], null],
    [21, "escândio", 184, "metal de transição", 44.95591, 1.36, 4, 3, "Sc", "S", 3, 4, [2, 8, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d1", [3], 1879, ["Lars Fredrik Nilson", "Per Teodor Cleve"], [], null],
    [22, "titânio", 176, "metal de transição", 47.867, 1.54, 4, 4, "Ti", "S", 4, 4, [2, 8, 10, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d2", [2, 3, 4], 1791, ["William Justin Gregor"], [], null],
    [23, "vanádio", 171, "metal de transição", 50.9415, 1.63, 4, 5, "V", "S", 5, 4, [2, 8, 11, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d3", [2, 3, 4, 5], 1801, ["Andrés Manuel del Río"], [], null],
    [24, "cromo", 166, "metal de transição", 51.9961, 1.66, 4, 6, "Cr", "S", 6, 4, [2, 8, 13, 1], "1s2 2s2 2p6 3s2 3p6 4s1 3d5", [3], 1797, ["Louis Nicolas Vauquelin"], [], null],
    [25, "manganês", 161, "metal de transição", 54.938049, 1.55, 4, 7, "Mn", "S", 7, 4, [2, 8, 13, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d5", [2, 3, 4, 6, 7], 1774, ["Carl Wilhelm Scheele", "Johan Gottlieb Gahn", "Ignatius Gottfried Kaim"], [], null],
    [26, "ferro", 156, "metal de transição", 55.845, 1.83, 4, 8, "Fe", "S", 8, 4, [2, 8, 14, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d6", [2, 3], null, null, [], 'ferrum'],
    [27, "cobalto", 152, "metal de transição", 58.9332, 1.88, 4, 9, "Co", "S", 9, 4, [2, 8, 15, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d7", [2, 3], 1735, ["George Brandt"], [], null],
    [28, "níquel", 149, "metal de transição", 58.6934, 1.91, 4, 10, "Ni", "S", 10, 4, [2, 8, 16, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d8", [2, 0, 1, 3, 4], 1751, ["Axel Fredrik Cronstedt"], [], null],
    [29, "cobre", 145, "metal de transição", 63.546, 1.9, 4, 11, "Cu", "S", 11, 4, [2, 8, 18, 1], "1s2 2s2 2p6 3s2 3p6 4s1 3d10", [2, 1], null, null, [], 'cuprum'],
    [30, "zinco", 142, "metal de transição", 65.409, 1.65, 4, 12, "Zn", "S", 12, 4, [2, 8, 18, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10", [2], 1746, ["Andreas Sigismund Marggraf"], [], null],
    [31, "gálio", 136, "outros metais", 69.723, 1.81, 4, 13, "Ga", "S", 13, 4, [2, 8, 18, 3], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p1", [3], 1875, ["Paul-Émile Lecoq de Boisbaudran"], [], null],
    [32, "germânio", 125, "semimetal", 72.64, 2.01, 4, 14, "Ge", "S", 14, 4, [2, 8, 18, 4], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p2", [4], 1886, ["Clemens Winkler"], [], null],
    [33, "arsênio", 114, "semimetal", 74.9216, 2.18, 4, 15, "As", "S", 15, 4, [2, 8, 18, 5], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p3", [-3, 0, 3, 5], 1250, ["Alberto Magno"], [], null],
    [34, "selênio", 103, "ametal", 78.96, 2.55, 4, 16, "Se", "S", 16, 4, [2, 8, 18, 6], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p4", [-2], 1817, ["Jöns Jacob Berzelius", "Johan Gottlieb Gahn"], [], null],
    [35, "bromo", 94, "halogênio", 79.904, 2.96, 4, 17, "Br", "L", 17, 4, [2, 8, 18, 7], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p5", [-1], 1826, ["Antoine Jérôme Balard", "Carl Jacob Löwig"], [], null],
    [36, "criptônio", 88, "gás nobre", 83.798, null, 4, 18, "Kr", "G", 18, 4, [2, 8, 18, 8], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6", [], 1898, ["William Ramsay", "Morris William Travers"], [], null],
    [37, "rubídio", 265, "metal alcalino", 85.4678, 0.82, 5, 1, "Rb", "S", 1, 5, [2, 8, 18, 8, 1], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1", [1], 1861, ["Gustav Kirchhoff", "Robert Bunsen"], [], null],
    [38, "estrôncio", 219, "metal alcalino terroso", 87.62, 0.95, 5, 2, "Sr", "S", 2, 5, [2, 8, 18, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2", [2], 1790, ["Humphry Davy", "Adair Crawford", "William Cruickshank"], [], null],
    [39, "ítrio", 212, "metal de transição", 88.90585, 1.22, 5, 3, "Y", "S", 3, 5, [2, 8, 18, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d1", [3], 1794, ["Johan Gadolin"], [], null],
    [40, "zircônio", 206, "metal de transição", 91.224, 1.33, 5, 4, "Zr", "S", 4, 5, [2, 8, 18, 10, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d2", [4], 1789, ["Martin Heinrich Klaproth"], [], null],
    [41, "nióbio", 198, "metal de transição", 92.90638, 1.6, 5, 5, "Nb", "S", 5, 5, [2, 8, 18, 12, 1], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d4", [5], 1801, ["Charles Hatchett"], [], null],
    [42, "molibdênio", 190, "metal de transição", 95.94, 2.16, 5, 6, "Mo", "S", 6, 5, [2, 8, 18, 13, 1], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d5", [6], 1778, ["Carl Wilhelm Scheele"], [], null],
    [43, "tecnécio", 183, "metal de transição", 97.9072, 1.9, 5, 7, "Tc", "S", 7, 5, [2, 8, 18, 13, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d5", [], 1937, ["Emilio Gino Segrè", "Carlo Perrier"], [], null],
    [44, "rutênio", 178, "metal de transição", 101.07, 2.2, 5, 8, "Ru", "S", 8, 5, [2, 8, 18, 15, 1], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d7", [], 1844, ["Karl Ernst Claus"], [], null],
    [45, "ródio", 173, "metal de transição", 102.9055, 2.28, 5, 9, "Rh", "S", 9, 5, [2, 8, 18, 16, 1], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d8", [], 1803, ["William Hyde Wollaston"], [], null],
    [46, "paládio", 169, "metal de transição", 106.42, 2.2, 5, 10, "Pd", "S", 10, 5, [2, 8, 18, 18], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 4d10", [2, 4], 1803, ["William Hyde Wollaston"], [], null],
    [47, "prata", 165, "metal de transição", 107.8682, 1.93, 5, 11, "Ag", "S", 11, 5, [2, 8, 18, 18, 1], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d10", [1], null, null, [], 'argentum'],
    [48, "cádmio", 161, "metal de transição", 112.411, 1.69, 5, 12, "Cd", "S", 12, 5, [2, 8, 18, 18, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10", [2], 1817, ["Friedrich Stromeyer", "Karl Samuel Leberecht Hermann"], [], null],
    [49, "índio", 156, "outros metais", 114.818, 1.78, 5, 13, "In", "S", 13, 5, [2, 8, 18, 18, 3], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p1", [], 1863, ["Ferdinand Reich"], [], null],
    [50, "estanho", 145, "outros metais", 118.71, 1.96, 5, 14, "Sn", "S", 14, 5, [2, 8, 18, 18, 4], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p2", [2], 1765, null, [], 'stannum'],
    [51, "antimônio", 133, "semimetal", 121.76, 2.05, 5, 15, "Sb", "S", 15, 5, [2, 8, 18, 18, 5], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p3", [], null, null, [], 'stibium'],
    [52, "telúrio", 123, "semimetal", 127.6, 2.1, 5, 16, "Te", "S", 16, 5, [2, 8, 18, 18, 6], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p4", [-2], 1782, ["Martin Heinrich Klaproth", "Franz Joseph Müller von Reichenstein"], [], null],
    [53, "iodo", 115, "halogênio", 126.90447, 2.66, 5, 17, "I", "S", 17, 5, [2, 8, 18, 18, 7], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p5", [-1], 1811, ["Bernard Courtois"], [], null],
    [54, "xenônio", 108, "gás nobre", 131.293, 2.6, 5, 18, "Xe", "G", 18, 5, [2, 8, 18, 18, 8], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6", [], 1898, ["William Ramsay", "Morris William Travers"], [], null],
    [55, "césio", 298, "metal alcalino", 132.90545, 0.79, 6, 1, "Cs", "S", 1, 6, [2, 8, 18, 18, 8, 1], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s1", [1], 1860, ["Robert Bunsen", "Gustav Kirchhoff"], [], null],
    [56, "bário", 253, "metal alcalino terroso", 137.327, 0.89, 6, 2, "Ba", "S", 2, 6, [2, 8, 18, 18, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2", [2], 1808, ["Humphry Davy", "Carl Wilhelm Scheele"], [], null],
    [57, "lantânio", null, "lantanídeo", 138.9055, 1.1, 6, 3, "La", "S", 4, 9, [2, 8, 18, 18, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 5d1", [3], 1839, ["Carl Gustaf Mosander"], [], null],
    [58, "cério", null, "lantanídeo", 140.116, 1.12, 6, 3, "Ce", "S", 5, 9, [2, 8, 18, 19, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 5d1 4f1", [3], 1803, ["Jöns Jacob Berzelius", "Martin Heinrich Klaproth", "Carl Gustaf Mosander"], [], null],
    [59, "praseodímio", 247, "lantanídeo", 140.90765, 1.13, 6, 3, "Pr", "S", 6, 9, [2, 8, 18, 21, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f3", [], 1885, ["Carl Auer von Welsbach"], [], null],
    [60, "neodímio", 206, "lantanídeo", 144.24, 1.14, 6, 3, "Nd", "S", 7, 9, [2, 8, 18, 22, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f4", [4], 1885, ["Carl Auer von Welsbach"], [], null],
    [61, "promécio", 205, "lantanídeo", 144.9127, 1.13, 6, 3, "Pm", "S", 8, 9, [2, 8, 18, 23, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f5", [3], 1945, ["Jacob A. Marinsky", "Charles D. Coryell", "Lawrence E. Glendenin"], [], null],
    [62, "samário", 238, "lantanídeo", 150.36, 1.17, 6, 3, "Sm", "S", 9, 9, [2, 8, 18, 24, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f6", [3, 2], 1879, ["Paul-Émile Lecoq de Boisbaudran"], [], null],
    [63, "európio", 231, "lantanídeo", 151.964, 1.2, 6, 3, "Eu", "S", 10, 9, [2, 8, 18, 25, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f7", [3], 1901, ["Paul-Émile Lecoq de Boisbaudran", "Eugène-Anatole Demarçay"], [], null],
    [64, "gadolínio", 233, "lantanídeo", 157.25, 1.2, 6, 3, "Gd", "S", 11, 9, [2, 8, 18, 25, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f7 5d1", [3], 1880, ["Jean Charles Galissard de Marignac", "Paul-Émile Lecoq de Boisbaudran"], [], null],
    [65, "térbio", 225, "lantanídeo", 158.92534, 1.1, 6, 3, "Tb", "S", 12, 9, [2, 8, 18, 27, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f9", [], 1843, ["Carl Gustaf Mosander"], [], null],
    [66, "disprósio", 228, "lantanídeo", 162.5, 1.22, 6, 3, "Dy", "S", 13, 9, [2, 8, 18, 28, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f10", [3], 1886, ["Paul-Émile Lecoq de Boisbaudran"], [], null],
    [67, "hólmio", null, "lantanídeo", 164.93032, 1.23, 6, 3, "Ho", "S", 14, 9, [2, 8, 18, 29, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f11", [], 1878, ["Per Teodor Cleve", "Marc Delafontaine", "Jacques Louis Soret"], [], null],
    [68, "érbio", 226, "lantanídeo", 167.259, 1.24, 6, 3, "Er", "S", 15, 9, [2, 8, 18, 30, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f12", [], 1843, ["Carl Gustaf Mosander"], [], null],
    [69, "túlio", 222, "lantanídeo", 168.93421, 1.25, 6, 3, "Tm", "S", 16, 9, [2, 8, 18, 31, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f13", [], 1879, ["Per Teodor Cleve"], [], null],
    [70, "itérbio", 222, "lantanídeo", 173.04, 1.1, 6, 3, "Yb", "S", 17, 9, [2, 8, 18, 32, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14", [], 1878, ["Jean Charles Galissard de Marignac"], [], null],
    [71, "lutécio", 217, "lantanídeo", 174.967, 1.27, 6, 3, "Lu", "S", 18, 9, [2, 8, 18, 32, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d1", [], 1907, ["Georges Urbain", "Charles James"], [], null],
    [72, "háfnio", 208, "metal de transição", 178.49, 1.3, 6, 4, "Hf", "S", 4, 6, [2, 8, 18, 32, 10, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d2", [4], 1923, ["George de Hevesy", "Dirk Coster"], [], null],
    [73, "tântalo", 200, "metal de transição", 180.9479, 1.5, 6, 5, "Ta", "S", 5, 6, [2, 8, 18, 32, 11, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d3", [3], 1802, ["Anders Gustaf Ekeberg"], [], null],
    [74, "tungstênio", 193, "metal de transição", 183.84, 2.36, 6, 6, "W", "S", 6, 6, [2, 8, 18, 32, 12, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d4", [4, 6], 1783, ["Juan José Delhuyar", "Fausto Delhuyar"], [], 'wolfram'],
    [75, "rênio", 188, "metal de transição", 186.207, 1.9, 6, 7, "Re", "S", 7, 6, [2, 8, 18, 32, 13, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d5", [], 1925, ["Ida Noddack", "Walter Noddack", "Otto Berg"], [], null],
    [76, "ósmio", 185, "metal de transição", 190.23, 2.2, 6, 8, "Os", "S", 8, 6, [2, 8, 18, 32, 14, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d6", [4, 3], 1803, null, [], null],
    [77, "irídio", 180, "metal de transição", 192.217, 2.2, 6, 9, "Ir", "S", 9, 6, [2, 8, 18, 32, 15, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d7", [], 1803, null, [], null],
    [78, "platina", 177, "metal de transição", 195.078, 2.28, 6, 10, "Pt", "S", 10, 6, [2, 8, 18, 32, 17, 1], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s1 4f14 5d9", [2], 1735, ["Antonio de Ulloa"], [], null],
    [79, "ouro", 174, "metal de transição", 196.96655, 2.54, 6, 11, "Au", "S", 11, 6, [2, 8, 18, 32, 18, 1], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s1 4f14 5d10", [3, 1], 1695, null, [], 'aurum'],
    [80, "mercúrio", 171, "metal de transição", 200.59, 2, 6, 12, "Hg", "L", 12, 6, [2, 8, 18, 32, 18, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10", [2, 1, 0], null, null, [], 'hydrargyrum'],
    [81, "tálio", 156, "outros metais", 204.3833, 2.04, 6, 13, "Tl", "S", 13, 6, [2, 8, 18, 32, 18, 3], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p1", [], 1861, ["William Crookes"], [], null],
    [82, "chumbo", 154, "outros metais", 207.2, 2.33, 6, 14, "Pb", "S", 14, 6, [2, 8, 18, 32, 18, 4], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p2", [2, 4], null, null, [], 'plumbum'],
    [83, "bismuto", 143, "outros metais", 208.98038, 2.02, 6, 15, "Bi", "S", 15, 6, [2, 8, 18, 32, 18, 5], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p3", [3, -3], 1753, ["Claude François Geoffroy"], [], null],
    [84, "polônio", 135, "outros metais", 208.9824, 2, 6, 16, "Po", "S", 16, 6, [2, 8, 18, 32, 18, 6], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p4", [-2, 2, 4], 1898, ["Marie Curie", "Pierre Curie"], [], null],
    [85, "astatínio", null, "halogênio", 209.9871, 2.2, 6, 17, "At", "S", 17, 6, [2, 8, 18, 32, 18, 7], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p5", [-1], 1940, ["Emilio Gino Segrè"], [], null],
    [86, "radônio", 120, "gás nobre", 222.0176, null, 6, 18, "Rn", "G", 18, 6, [2, 8, 18, 32, 18, 8], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6", [], 1900, ["Friedrich Ernst Dorn"], [], null],
    [87, "frâncio", 270, "metal alcalino", 223.0197, 0.7, 7, 1, "Fr", "S", 1, 7, [2, 8, 18, 32, 18, 8, 1], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s1", [1], 1939, ["Marguerite Catherine Perey"], [], null],
    [88, "rádio", null, "metal alcalino terroso", 226.0254, 0.89, 7, 2, "Ra", "S", 2, 7, [2, 8, 18, 32, 18, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2", [2], 1898, ["Marie Curie", "Pierre Curie"], [], null],
    [89, "actínio", null, "actinídeo", 227.0277, 1.1, 7, 3, "Ac", "S", 4, 10, [2, 8, 18, 32, 18, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 6d1", [3], 1899, ["André-Louis Debierne"], [], null],
    [90, "tório", null, "actinídeo", 232.0381, 1.3, 7, 3, "Th", "S", 5, 10, [2, 8, 18, 32, 18, 10, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 6d2", [4], 1828, ["Jöns Jacob Berzelius"], [], null],
    [91, "protactínio", null, "actinídeo", 231.03588, 1.5, 7, 3, "Pa", "S", 6, 10, [2, 8, 18, 32, 20, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f2 6d1", [5], 1913, ["Kasimir Fajans", "Oswald Helmuth Göhring"], [], null],
    [92, "urânio", null, "actinídeo", 238.02891, 1.38, 7, 3, "U", "S", 7, 10, [2, 8, 18, 32, 21, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f3 6d1", [3, 4, 5, 6], 1789, ["Martin Heinrich Klaproth"], [], null],
    [93, "netúnio", null, "actinídeo", 237.0482, 1.36, 7, 3, "Np", "S", 8, 10, [2, 8, 18, 32, 22, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f4 6d1", [], 1940, ["Edwin Mattison McMillan", "Philip Abelson"], [], null],
    [94, "plutônio", null, "actinídeo", 244.0642, 1.28, 7, 3, "Pu", "S", 9, 10, [2, 8, 18, 32, 24, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f6", [3, 4, 5, 6, 7], 1940, ["Arthur Wahl", "Glenn Theodore Seaborg", "Edwin Mattison McMillan", "Joseph William Kennedy"], [], null],
    [95, "amerício", null, "actinídeo", 243.0614, 1.3, 7, 3, "Am", "S", 10, 10, [2, 8, 18, 32, 25, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f7", [], 1944, ["Albert Ghiorso", "Glenn Theodore Seaborg", "Ralph A. James"], [], null],
    [96, "cúrio", null, "actinídeo", 247.0704, 1.3, 7, 3, "Cm", "S", 11, 10, [2, 8, 18, 32, 25, 9, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f7 6d1", [], 1944, ["Glenn Theodore Seaborg", "Ralph A. James"], [], null],
    [97, "berquélio", null, "actinídeo", 247.0703, 1.3, 7, 3, "Bk", "S", 12, 10, [2, 8, 18, 32, 27, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f9", [3, 4], 1949, ["Glenn Theodore Seaborg", "Albert Ghiorso"], [], null],
    [98, "califórnio", null, "actinídeo", 251.0796, 1.3, 7, 3, "Cf", "S", 13, 10, [2, 8, 18, 32, 28, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f10", [], 1950, ["Albert Ghiorso", "Glenn Theodore Seaborg"], [], null],
    [99, "einstéinio", null, "actinídeo", 252.083, 1.3, 7, 3, "Es", "S", 14, 10, [2, 8, 18, 32, 29, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f11", [], 1952, ["Albert Ghiorso", "Glenn Theodore Seaborg"], [], null],
    [100, "férmio", null, "actinídeo", 257.0951, 1.3, 7, 3, "Fm", "S", 15, 10, [2, 8, 18, 32, 30, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f12", [], 1953, ["Glenn Theodore Seaborg", "Albert Ghiorso"], [], null],
    [101, "mendelévio", null, "actinídeo", 258.0984, 1.3, 7, 3, "Md", "S", 16, 10, [2, 8, 18, 32, 31, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f13", [], 1955, ["Glenn Theodore Seaborg"], [], null],
    [102, "nobélio", null, "actinídeo", 259.101, 1.3, 7, 3, "No", "S", 17, 10, [2, 8, 18, 32, 32, 8, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14", [], 1958, ["Glenn Theodore Seaborg", "Instituto Central de Investigações Nucleares"], [], null],
    [103, "laurêncio", null, "actinídeo", 262.1097, null, 7, 3, "Lr", "S", 18, 10, [2, 8, 18, 32, 32, 8, 3], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 7p1", [], 1961, ["Laboratório Nacional de Lawrence Berkeley"], [], null],
    [104, "rutherfórdio", null, "metal de transição", 261.1088, null, 7, 4, "Rf", "S", 4, 7, [2, 8, 18, 32, 32, 10, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d2", [], 1964, ["Albert Ghiorso", "Instituto Central de Investigações Nucleares"], [], null],
    [105, "dúbnio", null, "metal de transição", 262.1141, null, 7, 5, "Db", "S", 5, 7, [2, 8, 18, 32, 32, 11, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d3", [], 1967, ["Albert Ghiorso", "Laboratório Nacional de Lawrence Berkeley", "Instituto Central de Investigações Nucleares"], [], null],
    [106, "seabórgio", null, "metal de transição", 266.1219, null, 7, 6, "Sg", "S", 6, 7, [2, 8, 18, 32, 32, 12, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d4", [], 1974, ["Albert Ghiorso", "Laboratório Nacional de Lawrence Berkeley"], [], null],
    [107, "bóhrio", null, "metal de transição", 264.12, null, 7, 7, "Bh", "S", 7, 7, [2, 8, 18, 32, 32, 13, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d5", [], 1981, ["Peter Armbruster", "Gottfried Münzenberg"], [], null],
    [108, "hássio", null, "metal de transição", 277, null, 7, 8, "Hs", "S", 8, 7, [2, 8, 18, 32, 32, 14, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d6", [], 1984, ["Peter Armbruster", "Gottfried Münzenberg"], [], null],
    [109, "meitnério", null, "desconhecido", 268.1388, null, 7, 9, "Mt", "S", 9, 7, [2, 8, 18, 32, 32, 15, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d7", [], 1982, ["Peter Armbruster", "Gottfried Münzenberg"], [], null],
    [110, "darmstadtio", null, "desconhecido", 281, null, 7, 10, "Ds", "S", 10, 7, [2, 8, 18, 32, 32, 16, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d8", [], 1994, ["Sigurd Hofmann"], [], null],
    [111, "roentgénio", null, "desconhecido", 272.1535, null, 7, 11, "Rg", "S", 11, 7, [2, 8, 18, 32, 32, 17, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d9", [], 1994, ["Sigurd Hofmann"], [], null],
    [112, "copernício", null, "metal de transição", 285, null, 7, 12, "Cn", "L", 12, 7, [2, 8, 18, 32, 32, 18, 2], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10", [], 1996, ["Sigurd Hofmann"], [], null],
    [113, "nihônio", null, "desconhecido", 286, null, 7, 13, "Nh", "S", 13, 7, [2, 8, 18, 32, 32, 18, 3], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p1", [], 2003, ["Riken"], [], null],
    [114, "fleróvio", null, "outros metais", 289, null, 7, 14, "Fl", "S", 14, 7, [2, 8, 18, 32, 32, 18, 4], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p2", [], 1998, ["Sigurd Hofmann", "Instituto Central de Investigações Nucleares", "Laboratório Flerov de Reações Nucleares"], [], null],
    [115, "moscóvio", null, "desconhecido", 289, null, 7, 15, "Mc", "S", 15, 7, [2, 8, 18, 32, 32, 18, 5], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p3", [], 2003, null, [], null],
    [116, "livermório", null, "desconhecido", 289, null, 7, 16, "Lv", "S", 16, 7, [2, 8, 18, 32, 32, 18, 6], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p4", [], 2000, ["Instituto Central de Investigações Nucleares"], [], null],
    [117, "tenesso", null, "desconhecido", 294, null, 7, 17, "Ts", "S", 17, 7, [2, 8, 18, 32, 32, 18, 7], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p5", [], 2010, ["Yuri Oganessian", "Instituto Central de Investigações Nucleares"], [], null],
    [118, "oganessônio", null, "desconhecido", 294, null, 7, 18, "Og", "S", 18, 7, [2, 8, 18, 32, 32, 18, 8], "1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p6", [], 2002, ["Yuri Oganessian"], [], null]
]

const descobertas = [
    {
      "elemento": "Hidrogênio",
      "ano": 1766,
      "descobridor": "Henry Cavendish",
      "descricao": "Isolado como gás inflamável, nomeado por Lavoisier em 1783."
    },
    {
      "elemento": "Hélio",
      "ano": 1868,
      "descobridor": "Janssen e Lockyer",
      "descricao": "Detectado no espectro solar antes de ser isolado na Terra em 1895."
    },
    {
      "elemento": "Lítio",
      "ano": 1817,
      "descobridor": "Johan August Arfwedson",
      "descricao": "Descoberto em minerais de petalita, nome derivado do grego 'lithos' (pedra)."
    },
    {
      "elemento": "Berílio",
      "ano": 1798,
      "descobridor": "Louis Nicolas Vauquelin",
      "descricao": "Isolado de minerais como berilo e crisoberilo."
    },
    {
      "elemento": "Boro",
      "ano": 1808,
      "descobridor": "Humphry Davy, Joseph Louis Gay-Lussac e Louis Jacques Thénard",
      "descricao": "Isolado simultaneamente por métodos diferentes."
    },
    {
      "elemento": "Carbono",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Conhecido desde a antiguidade na forma de carvão e grafite."
    },
    {
      "elemento": "Nitrogênio",
      "ano": 1772,
      "descobridor": "Daniel Rutherford",
      "descricao": "Isolado do ar, inicialmente chamado de 'ar fixo'."
    },
    {
      "elemento": "Oxigênio",
      "ano": 1774,
      "descobridor": "Joseph Priestley e Carl Wilhelm Scheele",
      "descricao": "Descoberto independentemente por ambos; Priestley isolou o gás primeiro."
    },
    {
      "elemento": "Flúor",
      "ano": 1886,
      "descobridor": "Henri Moissan",
      "descricao": "Isolado após muitos anos de tentativas perigosas."
    },
    {
      "elemento": "Neônio",
      "ano": 1898,
      "descobridor": "Sir William Ramsay e Morris W. Travers",
      "descricao": "Descoberto na separação do ar líquido."
    },
    {
      "elemento": "Sódio",
      "ano": 1807,
      "descobridor": "Humphry Davy",
      "descricao": "Isolado por eletrólise de soda cáustica."
    },
    {
      "elemento": "Magnésio",
      "ano": 1808,
      "descobridor": "Humphry Davy",
      "descricao": "Isolado por eletrólise de uma mistura de óxido de magnésio e mercúrio."
    },
    {
      "elemento": "Alumínio",
      "ano": 1825,
      "descobridor": "Hans Christian Ørsted",
      "descricao": "Primeira produção impura do metal."
    },
    {
      "elemento": "Silício",
      "ano": 1824,
      "descobridor": "Jöns Jacob Berzelius",
      "descricao": "Preparado em forma amorfa."
    },
    {
      "elemento": "Fósforo",
      "ano": 1669,
      "descobridor": "Hennig Brand",
      "descricao": "Descoberto a partir da destilação da urina."
    },
    {
      "elemento": "Enxofre",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Conhecido e utilizado desde tempos antigos."
    },
    {
      "elemento": "Cloro",
      "ano": 1774,
      "descobridor": "Carl Wilhelm Scheele",
      "descricao": "Produzido pela reação de ácido clorídrico com dióxido de manganês."
    },
    {
      "elemento": "Argônio",
      "ano": 1894,
      "descobridor": "Lord Rayleigh e Sir William Ramsay",
      "descricao": "Descoberto na análise do ar."
    },
    {
      "elemento": "Potássio",
      "ano": 1807,
      "descobridor": "Humphry Davy",
      "descricao": "Isolado por eletrólise da potassa."
    },
    {
      "elemento": "Cálcio",
      "ano": 1808,
      "descobridor": "Humphry Davy",
      "descricao": "Isolado por eletrólise do cloreto de cálcio fundido."
    },
    {
      "elemento": "Escândio",
      "ano": 1879,
      "descobridor": "Lars Fredrik Nilson",
      "descricao": "Descoberto em minerais de gadolinita da Escandinávia."
    },
    {
      "elemento": "Titânio",
      "ano": 1791,
      "descobridor": "William Gregor",
      "descricao": "Descoberto em minerais de ilmenita na Inglaterra."
    },
    {
      "elemento": "Vanádio",
      "ano": 1801,
      "descobridor": "Andrés Manuel del Río",
      "descricao": "Descoberto no México, inicialmente confundido com cromo."
    },
    {
      "elemento": "Cromo",
      "ano": 1797,
      "descobridor": "Nicolas-Louis Vauquelin",
      "descricao": "Isolado de um mineral vermelho chamado crocoíta."
    },
    {
      "elemento": "Manganês",
      "ano": 1774,
      "descobridor": "Johann Gottlieb Gahn",
      "descricao": "Isolado do mineral pirolusita."
    },
    {
      "elemento": "Ferro",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Usado desde 3000 a.C. na Mesopotâmia."
    },
    {
      "elemento": "Cobalto",
      "ano": 1735,
      "descobridor": "Georg Brandt",
      "descricao": "Descoberto na Suécia, isolado de minerais contendo arsênio."
    },
    {
      "elemento": "Níquel",
      "ano": 1751,
      "descobridor": "Axel Fredrik Cronstedt",
      "descricao": "Isolado de um minério chamado kupfernickel."
    },
    {
      "elemento": "Cobre",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Conhecido desde 9000 a.C., usado na Idade do Cobre."
    },
    {
      "elemento": "Zinco",
      "ano": 1746,
      "descobridor": "Andreas Marggraf",
      "descricao": "Isolado como metal puro, apesar de uso anterior em ligas."
    },
    {
      "elemento": "Gálio",
      "ano": 1875,
      "descobridor": "Paul Émile Lecoq de Boisbaudran",
      "descricao": "Descoberto por espectroscopia, confirmou previsão de Mendeleev."
    },
    {
      "elemento": "Germânio",
      "ano": 1886,
      "descobridor": "Clemens Winkler",
      "descricao": "Descoberto em um minério chamado argirodita."
    },
    {
      "elemento": "Arsênio",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Conhecido desde a antiguidade, usado em ligas e venenos."
    },
    {
      "elemento": "Selênio",
      "ano": 1817,
      "descobridor": "Jöns Jacob Berzelius",
      "descricao": "Descoberto na Suécia, associado ao elemento telúrio."
    },
    {
      "elemento": "Bromo",
      "ano": 1826,
      "descobridor": "Antoine Jérôme Balard",
      "descricao": "Descoberto na água do mar na França."
    },
    {
      "elemento": "Criptônio",
      "ano": 1898,
      "descobridor": "Sir William Ramsay e Morris W. Travers",
      "descricao": "Descoberto na separação do ar líquido."
    },
    {
      "elemento": "Rubídio",
      "ano": 1861,
      "descobridor": "Robert Bunsen e Gustav Kirchhoff",
      "descricao": "Descoberto por espectroscopia na Alemanha."
    },
    {
      "elemento": "Estrôncio",
      "ano": 1790,
      "descobridor": "Adair Crawford",
      "descricao": "Descoberto em minerais da Escócia."
    },
    {
      "elemento": "Ítrio",
      "ano": 1794,
      "descobridor": "Johan Gadolin",
      "descricao": "Descoberto em um mineral da Finlândia."
    },
    {
      "elemento": "Zircônio",
      "ano": 1789,
      "descobridor": "Martin Heinrich Klaproth",
      "descricao": "Isolado do mineral zircão."
    },
    {
      "elemento": "Nióbio",
      "ano": 1801,
      "descobridor": "Charles Hatchett",
      "descricao": "Descoberto em um mineral chamado columbita."
    },
    {
      "elemento": "Molibdênio",
      "ano": 1778,
      "descobridor": "Carl Wilhelm Scheele",
      "descricao": "Isolado do mineral molibdenita."
    },
    {
      "elemento": "Tecnécio",
      "ano": 1937,
      "descobridor": "Carlo Perrier e Emilio Segrè",
      "descricao": "Primeiro elemento sintético, produzido por bombardeio nuclear."
    },
    {
      "elemento": "Rutênio",
      "ano": 1844,
      "descobridor": "Karl Ernst Claus",
      "descricao": "Descoberto na Rússia em minerais de platina."
    },
    {
      "elemento": "Ródio",
      "ano": 1803,
      "descobridor": "William Hyde Wollaston",
      "descricao": "Isolado de minerais de platina."
    },
    {
      "elemento": "Paládio",
      "ano": 1803,
      "descobridor": "William Hyde Wollaston",
      "descricao": "Descoberto em minerais de platina."
    },
    {
      "elemento": "Prata",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Usada desde 3000 a.C. na Anatólia."
    },
    {
      "elemento": "Cádmio",
      "ano": 1817,
      "descobridor": "Friedrich Stromeyer",
      "descricao": "Descoberto na Alemanha em óxidos de zinco."
    },
    {
      "elemento": "Índio",
      "ano": 1863,
      "descobridor": "Ferdinand Reich e Hieronymus Theodor Richter",
      "descricao": "Descoberto na Alemanha por espectroscopia."
    },
    {
      "elemento": "Estanho",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Usado desde a Idade do Bronze."
    },
    {
      "elemento": "Antimônio",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Conhecido desde a antiguidade, usado em ligas e medicamentos."
    },
    {
      "elemento": "Telúrio",
      "ano": 1782,
      "descobridor": "Franz-Joseph Müller von Reichenstein",
      "descricao": "Descoberto na Transilvânia em minerais de ouro."
    },
    {
      "elemento": "Iodo",
      "ano": 1811,
      "descobridor": "Bernard Courtois",
      "descricao": "Descoberto em cinzas de algas marinhas."
    },
    {
      "elemento": "Xenônio",
      "ano": 1898,
      "descobridor": "Sir William Ramsay e Morris W. Travers",
      "descricao": "Descoberto na separação do ar líquido."
    },
    {
      "elemento": "Césio",
      "ano": 1860,
      "descobridor": "Robert Bunsen e Gustav Kirchhoff",
      "descricao": "Descoberto por espectroscopia na Alemanha."
    },
    {
      "elemento": "Bário",
      "ano": 1808,
      "descobridor": "Humphry Davy",
      "descricao": "Isolado por eletrólise de uma mistura de óxidos."
    },
    {
      "elemento": "Lantânio",
      "ano": 1839,
      "descobridor": "Carl Gustaf Mosander",
      "descricao": "Descoberto na Suécia em minerais de cerita."
    },
    {
      "elemento": "Cério",
      "ano": 1803,
      "descobridor": "Jöns Jacob Berzelius e Wilhelm Hisinger",
      "descricao": "Descoberto simultaneamente na Suécia."
    },
    {
      "elemento": "Praseodímio",
      "ano": 1885,
      "descobridor": "Carl Auer von Welsbach",
      "descricao": "Separado do didímio, que era uma mistura."
    },
    {
      "elemento": "Neodímio",
      "ano": 1885,
      "descobridor": "Carl Auer von Welsbach",
      "descricao": "Separado do didímio, que era uma mistura."
    },
    {
      "elemento": "Promécio",
      "ano": 1945,
      "descobridor": "Harold G. Enrico e colaboradores",
      "descricao": "Elemento radioativo sintético."
    },
    {
      "elemento": "Samário",
      "ano": 1879,
      "descobridor": "Paul Émile Lecoq de Boisbaudran",
      "descricao": "Descoberto na França em minerais de samarskita."
    },
    {
      "elemento": "Európio",
      "ano": 1901,
      "descobridor": "Eugène-Anatole Demarçay",
      "descricao": "Descoberto por espectroscopia na França."
    },
    {
      "elemento": "Gadolínio",
      "ano": 1880,
      "descobridor": "Jean Charles Galissard de Marignac",
      "descricao": "Descoberto na Suíça em minerais de gadolinita."
    },
    {
      "elemento": "Térbio",
      "ano": 1843,
      "descobridor": "Carl Gustaf Mosander",
      "descricao": "Separado de terras raras."
    },
    {
      "elemento": "Disprósio",
      "ano": 1886,
      "descobridor": "Paul Émile Lecoq de Boisbaudran",
      "descricao": "Descoberto na França."
    },
    {
      "elemento": "Hólmio",
      "ano": 1879,
      "descobridor": "Per Teodor Cleve",
      "descricao": "Descoberto na Suécia."
    },
    {
      "elemento": "Érbio",
      "ano": 1843,
      "descobridor": "Carl Gustaf Mosander",
      "descricao": "Separado de terras raras."
    },
    {
      "elemento": "Túlio",
      "ano": 1879,
      "descobridor": "Per Teodor Cleve",
      "descricao": "Descoberto na Suécia."
    },
    {
      "elemento": "Itérbio",
      "ano": 1878,
      "descobridor": "Jean Charles Galissard de Marignac",
      "descricao": "Separado de terras raras."
    },
    {
      "elemento": "Lutécio",
      "ano": 1907,
      "descobridor": "Georges Urbain",
      "descricao": "Separado de terras raras."
    },
    {
      "elemento": "Háfnio",
      "ano": 1923,
      "descobridor": "Dirk Coster e George de Hevesy",
      "descricao": "Descoberto na Dinamarca em minerais de zircônio."
    },
    {
      "elemento": "Tântalo",
      "ano": 1802,
      "descobridor": "Anders Ekeberg",
      "descricao": "Descoberto na Suécia."
    },
    {
      "elemento": "Tungstênio",
      "ano": 1783,
      "descobridor": "Juan José e Fausto Elhuyar",
      "descricao": "Nome 'wolfram' vem do mineral wolframita (Scheele, 1781). Descoberto em dois lugares diferentes."
    },
    {
      "elemento": "Rênio",
      "ano": 1925,
      "descobridor": "Ida Noddack, Walter Noddack e Otto Berg",
      "descricao": "Descoberto na Alemanha."
    },
    {
      "elemento": "Ósmio",
      "ano": 1803,
      "descobridor": "Smithson Tennant",
      "descricao": "Descoberto na Inglaterra em minerais de platina."
    },
    {
      "elemento": "Irídio",
      "ano": 1803,
      "descobridor": "Smithson Tennant",
      "descricao": "Descoberto na Inglaterra em minerais de platina."
    },
    {
      "elemento": "Platina",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Conhecida desde tempos pré-colombianos."
    },
    {
      "elemento": "Ouro",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Usado desde 4000 a.C. no Egito."
    },
    {
      "elemento": "Mercúrio",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Conhecido desde 1500 a.C., usado em termômetros."
    },
    {
      "elemento": "Tálio",
      "ano": 1861,
      "descobridor": "William Crookes",
      "descricao": "Descoberto por espectroscopia."
    },
    {
      "elemento": "Chumbo",
      "ano": "Antiguidade",
      "descobridor": "Desconhecido",
      "descricao": "Usado desde 3000 a.C."
    },
    {
      "elemento": "Bismuto",
      "ano": 1753,
      "descobridor": "Claude François Geoffroy",
      "descricao": "Distinto do chumbo e do estanho."
    },
    {
      "elemento": "Polônio",
      "ano": 1898,
      "descobridor": "Marie Curie e Pierre Curie",
      "descricao": "Descoberto na França, nomeado em homenagem à Polônia."
    },
    {
      "elemento": "Astatínio",
      "ano": 1940,
      "descobridor": "Dale R. Corson, Kenneth Ross MacKenzie e Emilio Segrè",
      "descricao": "Elemento radioativo sintético."
    },
    {
      "elemento": "Radônio",
      "ano": 1900,
      "descobridor": "Friedrich Ernst Dorn",
      "descricao": "Descoberto como produto da decomposição do rádio."
    },
    {
      "elemento": "Frâncio",
      "ano": 1939,
      "descobridor": "Marguerite Perey",
      "descricao": "Elemento radioativo sintético."
    },
    {
      "elemento": "Rádio",
      "ano": 1898,
      "descobridor": "Marie Curie e Pierre Curie",
      "descricao": "Descoberto na pechblenda."
    },
    {
      "elemento": "Actínio",
      "ano": 1899,
      "descobridor": "André-Louis Debierne",
      "descricao": "Descoberto na pechblenda."
    },
    {
      "elemento": "Tório",
      "ano": 1829,
      "descobridor": "Jöns Jacob Berzelius",
      "descricao": "Descoberto na Suécia."
    },
    {
      "elemento": "Protactínio",
      "ano": 1917,
      "descobridor": "Oswald Helmuth Göhring e Kasimir Fajans",
      "descricao": "Descoberto na Alemanha."
    },
    {
      "elemento": "Urânio",
      "ano": 1789,
      "descobridor": "Martin Heinrich Klaproth",
      "descricao": "Nomeado em homenagem ao planeta Urano."
    },
    {
      "elemento": "Netúnio",
      "ano": 1940,
      "descobridor": "Edwin McMillan e Philip H. Abelson",
      "descricao": "Primeiro elemento transurânico descoberto."
    },
    {
      "elemento": "Plutônio",
      "ano": 1940,
      "descobridor": "Glenn Seaborg e colaboradores",
      "descricao": "Primeiro elemento transurânico sintetizado."
    },
    {
      "elemento": "Amerício",
      "ano": 1944,
      "descobridor": "Glenn Seaborg e colaboradores",
      "descricao": "Produzido por bombardeamento de plutônio."
    },
    {
      "elemento": "Cúrio",
      "ano": 1944,
      "descobridor": "Glenn Seaborg e colaboradores",
      "descricao": "Produzido por bombardeamento de plutônio."
    },
    {
      "elemento": "Berquélio",
      "ano": 1949,
      "descobridor": "Glenn Seaborg e colaboradores",
      "descricao": "Produzido por bombardeamento de amerício."
    },
    {
      "elemento": "Califórnio",
      "ano": 1950,
      "descobridor": "Glenn Seaborg e colaboradores",
      "descricao": "Produzido por bombardeamento de curio."
    },
    {
      "elemento": "Einstéinio",
      "ano": 1952,
      "descobridor": "Albert Ghiorso e colaboradores",
      "descricao": "Produzido por bombardeamento de urânio."
    },
    {
      "elemento": "Férmio",
      "ano": 1952,
      "descobridor": "Albert Ghiorso e colaboradores",
      "descricao": "Descoberto em resíduos de testes nucleares."
    },
    {
      "elemento": "Mendelévio",
      "ano": 1955,
      "descobridor": "Albert Ghiorso e colaboradores",
      "descricao": "Produzido por bombardeamento de férmio."
    },
    {
      "elemento": "Nobélio",
      "ano": 1958,
      "descobridor": "Equipe do Instituto Nobel de Física",
      "descricao": "Produzido por bombardeamento de átomos pesados."
    },
    {
      "elemento": "Laurêncio",
      "ano": 1961,
      "descobridor": "Lawrence Berkeley National Laboratory",
      "descricao": "Produzido em aceleradores de partículas."
    },
    {
      "elemento": "Rutherfórdio",
      "ano": 1964,
      "descobridor": "Lawrence Berkeley National Laboratory",
      "descricao": "Produzido em aceleradores de partículas."
    },
    {
      "elemento": "Dúbnio",
      "ano": 1967,
      "descobridor": "Joint Institute for Nuclear Research e Lawrence Berkeley National Laboratory",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Seabórgio",
      "ano": 1974,
      "descobridor": "Joint Institute for Nuclear Research",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Bóhrio",
      "ano": 1981,
      "descobridor": "Gesellschaft für Schwerionenforschung (GSI)",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Hássio",
      "ano": 1984,
      "descobridor": "Gesellschaft für Schwerionenforschung (GSI)",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Meitnério",
      "ano": 1982,
      "descobridor": "Gesellschaft für Schwerionenforschung (GSI)",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Darmstadtio",
      "ano": 1994,
      "descobridor": "Gesellschaft für Schwerionenforschung (GSI)",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Roentgênio",
      "ano": 1994,
      "descobridor": "Gesellschaft für Schwerionenforschung (GSI)",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Copernício",
      "ano": 1996,
      "descobridor": "Joint Institute for Nuclear Research e Lawrence Livermore National Laboratory",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Nihônio",
      "ano": 2004,
      "descobridor": "RIKEN (Japão)",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Fleróvio",
      "ano": 1999,
      "descobridor": "Joint Institute for Nuclear Research",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Moscóvio",
      "ano": 2003,
      "descobridor": "Joint Institute for Nuclear Research",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Livermório",
      "ano": 2000,
      "descobridor": "Lawrence Livermore National Laboratory",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Tenesso",
      "ano": 2010,
      "descobridor": "Joint Institute for Nuclear Research e Lawrence Livermore National Laboratory",
      "descricao": "Produzido em colisões nucleares."
    },
    {
      "elemento": "Oganessônio",
      "ano": 2006,
      "descobridor": "Joint Institute for Nuclear Research",
      "descricao": "Produzido em colisões nucleares."
    }
  ];  

const significados = [
    {
      "elemento": "Hidrogênio",
      "significado": "Do grego hydro (água) + genes (formador), significa 'formador de água'."
    },
    {
      "elemento": "Hélio",
      "significado": "Nome do deus do sol grego, pois foi detectado primeiro no Sol."
    },
    {
      "elemento": "Lítio",
      "significado": "Do grego lithos, que significa 'pedra', pois foi encontrado em minerais."
    },
    {
      "elemento": "Berílio",
      "significado": "Derivado do mineral berilo, nome grego."
    },
    {
      "elemento": "Boro",
      "significado": "Do árabe buraq, nome do mineral bórax."
    },
    {
      "elemento": "Carbono",
      "significado": "Do latim carbo, que significa 'carvão'."
    },
    {
      "elemento": "Nitrogênio",
      "significado": "Do grego nitro + genes, que significa 'formador de salitre'."
    },
    {
      "elemento": "Oxigênio",
      "significado": "Do grego oxy + genes, que significa 'formador de ácido'."
    },
    {
      "elemento": "Flúor",
      "significado": "Do latim fluere, que significa 'fluir', em referência à fluidez do mineral fluorita."
    },
    {
      "elemento": "Neônio",
      "significado": "Do grego neos, que significa 'novo'."
    },
    {
      "elemento": "Sódio",
      "significado": "Do inglês soda, derivado do italiano sida, e do egípcio natron, carbonato usado na mumificação."
    },
    {
      "elemento": "Magnésio",
      "significado": "Derivado da região da Grécia chamada Magnésia."
    },
    {
      "elemento": "Alumínio",
      "significado": "Do latim alumen, que significa 'sal amargo'."
    },
    {
      "elemento": "Silício",
      "significado": "Do latim silex ou silicis, que significa 'pedra'."
    },
    {
      "elemento": "Fósforo",
      "significado": "Do grego phosphorus, que significa 'portador de luz'."
    },
    {
      "elemento": "Enxofre",
      "significado": "Do árabe as-sufr e do latim sulphur."
    },
    {
      "elemento": "Cloro",
      "significado": "Do grego chlorós, que significa 'verde amarelado'."
    },
    {
      "elemento": "Argônio",
      "significado": "Do grego argos, que significa 'inativo'."
    },
    {
      "elemento": "Potássio",
      "significado": "Do latim kalium."
    },
    {
      "elemento": "Cálcio",
      "significado": "Do latim calx, que significa 'pedra calcária'."
    },
    {
      "elemento": "Escândio",
      "significado": "Derivado da Escandinávia."
    },
    {
      "elemento": "Titânio",
      "significado": "Nome dos Titãs da mitologia grega."
    },
    {
      "elemento": "Vanádio",
      "significado": "Homenagem a Vanadis, deusa nórdica do amor e fertilidade."
    },
    {
      "elemento": "Cromo",
      "significado": "Do grego chroma, que significa 'cor'."
    },
    {
      "elemento": "Manganês",
      "significado": "Nome de origem incerta, confundido com magnésio."
    },
    {
      "elemento": "Ferro",
      "significado": "Do latim ferrum."
    },
    {
      "elemento": "Cobalto",
      "significado": "Do alemão kobold, que significa 'demônio'."
    },
    {
      "elemento": "Níquel",
      "significado": "Do alemão kupfernickel, que significa 'cobre do diabo'."
    },
    {
      "elemento": "Cobre",
      "significado": "Do latim cuprum."
    },
    {
      "elemento": "Zinco",
      "significado": "Derivado de minerais chamados calamina."
    },
    {
      "elemento": "Gálio",
      "significado": "Derivado de Gallia, nome latino da França."
    },
    {
      "elemento": "Germânio",
      "significado": "Derivado da Germânia, nome latino da Alemanha."
    },
    {
      "elemento": "Arsênio",
      "significado": "Do grego arsenikon, que significa 'masculino' ou 'forte'."
    },
    {
      "elemento": "Selênio",
      "significado": "Do grego selene, que significa 'lua'."
    },
    {
      "elemento": "Bromo",
      "significado": "Do grego bromos, que significa 'odor ruim'."
    },
    {
      "elemento": "Criptônio",
      "significado": "Do grego kryptos, que significa 'oculto'."
    },
    {
      "elemento": "Rubídio",
      "significado": "Do latim rubidus, que significa 'vermelho'."
    },
    {
      "elemento": "Estrôncio",
      "significado": "Nome da vila de Strontian, na Escócia."
    },
    {
      "elemento": "Ítrio",
      "significado": "Nome da vila de Ytterby, na Suécia."
    },
    {
      "elemento": "Zircônio",
      "significado": "Nome do mineral zircão."
    },
    {
      "elemento": "Nióbio",
      "significado": "Nome da personagem mitológica Niobe."
    },
    {
      "elemento": "Molibdênio",
      "significado": "Do grego molybdos, que significa 'chumbo'."
    },
    {
      "elemento": "Tecnécio",
      "significado": "Do grego technetos, que significa 'artificial'."
    },
    {
      "elemento": "Rutênio",
      "significado": "Derivado do nome latino da Rússia, Ruthenia."
    },
    {
      "elemento": "Ródio",
      "significado": "Do grego rhodon, que significa 'rosa'."
    },
    {
      "elemento": "Paládio",
      "significado": "Referência à deusa Pallas Atena."
    },
    {
      "elemento": "Prata",
      "significado": "Do latim vulgar platta, que significa 'achatado'."
    },
    {
      "elemento": "Cádmio",
      "significado": "Derivado do minério calamina."
    },
    {
      "elemento": "Índio",
      "significado": "Referência à cor índigo emitida em espectroscopia."
    },
    {
      "elemento": "Estanho",
      "significado": "Do latim stannum."
    },
    {
      "elemento": "Antimônio",
      "significado": "Do grego anti monos, que significa 'aquele que não é encontrado sozinho'."
    },
    {
      "elemento": "Telúrio",
      "significado": "Do latim tellus, que significa 'terra'."
    },
    {
      "elemento": "Iodo",
      "significado": "Do grego iodes, que significa 'violeta'."
    },
    {
      "elemento": "Xenônio",
      "significado": "Do grego xenos, que significa 'estranho'."
    },
    {
      "elemento": "Césio",
      "significado": "Do latim caesius, que significa 'azul celeste'."
    },
    {
      "elemento": "Bário",
      "significado": "Do grego barys, que significa 'pesado'."
    },
    {
      "elemento": "Lantânio",
      "significado": "Do grego lanthanein, que significa 'esconder-se'."
    },
    {
      "elemento": "Cério",
      "significado": "Nome do asteroide Ceres."
    },
    {
      "elemento": "Praseodímio",
      "significado": "Do grego prasios (verde) + didymos (gêmeo)."
    },
    {
      "elemento": "Neodímio",
      "significado": "Do grego neos (novo) + didymos (gêmeo)."
    }
    ,
        {
          "elemento": "Praseodímio",
          "significado": "Do grego prasios (verde) + didymos (gêmeo), referindo-se aos sais coloridos e à sua separação do didímio."
        },
        {
          "elemento": "Neodímio",
          "significado": "Do grego neos (novo) + didymos (gêmeo), nome dado por ser separado do didímio."
        },
        {
          "elemento": "Promécio",
          "significado": "Derivado de Prometeu, personagem da mitologia grega que roubou o fogo dos deuses."
        },
        {
          "elemento": "Samário",
          "significado": "Nome derivado do mineral samarskita, onde foi encontrado."
        },
        {
          "elemento": "Európio",
          "significado": "Nome derivado da Europa, personagem da mitologia grega."
        },
        {
          "elemento": "Gadolínio",
          "significado": "Nome em homenagem ao químico finlandês Johan Gadolin."
        },
        {
          "elemento": "Térbio",
          "significado": "Nome derivado da vila de Ytterby, na Suécia, como outros lantanídeos."
        },
        {
          "elemento": "Disprósio",
          "significado": "Do grego dysprositos, que significa 'difícil de obter'."
        },
        {
          "elemento": "Hólmio",
          "significado": "Nome derivado de Holmia, nome latino para Estocolmo, Suécia."
        },
        {
          "elemento": "Érbio",
          "significado": "Nome derivado da vila de Ytterby, na Suécia."
        },
        {
          "elemento": "Túlio",
          "significado": "Nome derivado de Thule, nome antigo para uma região nórdica."
        },
        {
          "elemento": "Itérbio",
          "significado": "Nome derivado da vila de Ytterby, na Suécia."
        },
        {
          "elemento": "Lutécio",
          "significado": "Nome derivado de Lutetia, nome romano para Paris."
        },
        {
          "elemento": "Háfnio",
          "significado": "Nome derivado de Hafnia, nome latino para Copenhague."
        },
        {
          "elemento": "Tântalo",
          "significado": "Nome derivado do personagem mitológico Tântalo, que sofreu tormentos eternos."
        },
        {
          "elemento": "Tungstênio",
          "significado": "Do sueco tung sten, que significa 'pedra pesada'."
        },
        {
          "elemento": "Rênio",
          "significado": "Nome derivado do rio Reno, na Europa."
        },
        {
          "elemento": "Ósmio",
          "significado": "Do grego osme, que significa 'odor', referindo-se ao cheiro forte do ósmio."
        },
        {
          "elemento": "Irídio",
          "significado": "Do latim iris, que significa 'arco-íris', pela variedade de cores dos compostos."
        },
        {
          "elemento": "Platina",
          "significado": "Diminutivo espanhol de plata, que significa 'prata'."
        },
        {
          "elemento": "Ouro",
          "significado": "Do latim aurum, que significa 'brilhante amanhecer' ou 'brilhante'."
        },
        {
          "elemento": "Mercúrio",
          "significado": "Nome do deus romano Mercúrio, mensageiro dos deuses."
        },
        {
          "elemento": "Tálio",
          "significado": "Do grego thallos, que significa 'broto verde'."
        },
        {
          "elemento": "Chumbo",
          "significado": "Do latim plumbum."
        },
        {
          "elemento": "Bismuto",
          "significado": "Possível origem do alemão wismut, que significa 'metal branco'."
        },
        {
          "elemento": "Polônio",
          "significado": "Nome em homenagem à Polônia, terra natal de Marie Curie."
        },
        {
          "elemento": "Astatínio",
          "significado": "Do grego astatos, que significa 'instável'."
        },
        {
          "elemento": "Radônio",
          "significado": "Derivado do rádio, elemento do qual é produto de decaimento."
        },
        {
          "elemento": "Frâncio",
          "significado": "Nome em homenagem à França."
        },
        {
          "elemento": "Rádio",
          "significado": "Do latim radius, que significa 'raio'."
        },
        {
          "elemento": "Actínio",
          "significado": "Do grego aktinos, que significa 'raio' ou 'feixe'."
        },
        {
          "elemento": "Tório",
          "significado": "Nome em homenagem ao deus nórdico Thor."
        },
        {
          "elemento": "Protactínio",
          "significado": "Do grego protos, que significa 'primeiro', e actínio."
        },
        {
          "elemento": "Urânio",
          "significado": "Nome em homenagem ao planeta Urano."
        },
        {
          "elemento": "Netúnio",
          "significado": "Nome em homenagem ao planeta Netuno."
        },
        {
          "elemento": "Plutônio",
          "significado": "Nome em homenagem ao planeta Plutão."
        },
        {
          "elemento": "Amerício",
          "significado": "Nome em homenagem ao continente americano."
        },
        {
          "elemento": "Cúrio",
          "significado": "Nome em homenagem a Marie Curie e Pierre Curie."
        },
        {
          "elemento": "Berquélio",
          "significado": "Nome em homenagem a Pierre Curie e Marie Curie, cujo nome de solteira era Berquel."
        },
        {
          "elemento": "Califórnio",
          "significado": "Nome em homenagem ao estado da Califórnia, EUA."
        },
        {
          "elemento": "Einstênio",
          "significado": "Nome em homenagem a Albert Einstein."
        },
        {
          "elemento": "Férmio",
          "significado": "Nome em homenagem a Enrico Fermi."
        },
        {
          "elemento": "Mendelévio",
          "significado": "Nome em homenagem a Dmitri Mendeléyev."
        },
        {
          "elemento": "Nobélio",
          "significado": "Nome em homenagem a Alfred Nobel."
        },
        {
          "elemento": "Laurêncio",
          "significado": "Nome em homenagem ao Laboratório Lawrence Berkeley."
        },
        {
          "elemento": "Rutherfórdio",
          "significado": "Nome em homenagem a Ernest Rutherford."
        },
        {
          "elemento": "Dúbnio",
          "significado": "Nome em homenagem à cidade de Dubna, Rússia."
        },
        {
          "elemento": "Seabórgio",
          "significado": "Nome em homenagem a Glenn T. Seaborg."
        },
        {
          "elemento": "Bóhrio",
          "significado": "Nome em homenagem a Niels Bohr."
        },
        {
          "elemento": "Hássio",
          "significado": "Nome derivado do estado alemão de Hesse."
        },
        {
          "elemento": "Meitnério",
          "significado": "Nome em homenagem a Lise Meitner."
        },
        {
          "elemento": "Darmstadtio",
          "significado": "Nome em homenagem à cidade de Darmstadt, Alemanha."
        },
        {
          "elemento": "Roentgênio",
          "significado": "Nome em homenagem a Wilhelm Röntgen."
        },
        {
          "elemento": "Copernício",
          "significado": "Nome em homenagem a Nicolau Copérnico."
        },
        {
          "elemento": "Nihônio",
          "significado": "Nome derivado do Japão (Nihon)."
        },
        {
          "elemento": "Fleróvio",
          "significado": "Nome em homenagem à região de Fléron, Bélgica."
        },
        {
          "elemento": "Moscóvio",
          "significado": "Nome em homenagem a Moscou, Rússia."
        },
        {
          "elemento": "Livermório",
          "significado": "Nome em homenagem ao Laboratório Nacional Lawrence Livermore."
        },
        {
          "elemento": "Tenesso",
          "significado": "Nome em homenagem ao estado do Tennessee, EUA."
        },
        {
          "elemento": "Oganessônio",
          "significado": "Nome em homenagem a Yuri Oganessian."
        }
      ]
      
  

function f(t) {
    if (t == null) return 'NULL'
    return t
}

function fix(s, max) {
    const l = `${s}`.length
    return (' '.repeat(max - l)) + s
}

const chemistries = new Set()

const b = a.map(([
    atomic_number, oficial_name, atomic_radius, category, atomic_mass,
    eletronegativity, period, family, symbol, fase, xpos, ypos, layers,
    electronic_configuration, oxidation_state, discovery_year, discovery,
    another_names, latin_name
]) => {
        // const descoberto = descobertas.find(a => a.elemento.toLowerCase() == oficial_name)

        // if (descoberto)
        //     console.log(descoberto.elemento, descoberto.descobridor.split(" e "))

        const significado = significados.find(a => a.elemento.toLowerCase() == oficial_name)?.significado

        const str = `(${
            fix(atomic_number, 20)
        },${
            fix(`'${oficial_name}'`, 14)
        }, ${
            fix(f(atomic_radius), 20)
        }, ${
            fix(`'${category}'`, 24)
        }, ${
            fix(f(atomic_mass), 20)
        }, ${
            fix(f(eletronegativity), 20)
        }, ${
            fix(period, 20)
        }, ${
            fix(family, 20)
        }, ${
            fix(`'${symbol}'`, 20)
        }, ${
            `'${fase}'`
        }, ${
            fix(xpos, 20)
        }, ${
            fix(ypos, 20)
        }, ${
            fix( `'${JSON.stringify(layers)}'` , 21)
        }, ${
            fix(f(latin_name) != 'NULL' ? `'${f(latin_name)}'` : 'NULL',20)
        }, ${
            fix(`'${JSON.stringify(another_names)}'`, 30)
        }, ${
            fix(`'${JSON.stringify(oxidation_state)}'`, 20)
        }, ${
            fix(significado ? `'${significado.replaceAll("'", "\\'")}'` : 'NULL', 97)
        }, ${
            fix(f(discovery_year), 20)
        }, '${electronic_configuration}')`

        console.log(str)
        
})

// console.log(a.map(e => e[1]).join(" ") )