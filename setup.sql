
CREATE TABLE element (
	`_id` INTEGER PRIMARY KEY,
	`atomic_number` INTEGER UNIQUE,
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`oficial_name` TEXT UNIQUE NOT NULL,
	`latin_name` TEXT DEFAULT NULL,
	`atomic_radius` INTEGER,
	`category` TEXT,
	`atomic_mass` REAL,
	`eletronegativity` REAL,
	`period` INTEGER NOT NULL,
	`family` INTEGER NOT NULL,
	`symbol` TEXT UNIQUE NOT NULL,
	`fase` CHAR,
	`xpos` INTEGER NOT NULL,
	`ypos` INTEGER NOT NULL,
	`layers` JSON,
	`electronic_configuration` TEXT,
	`oxidation_state` JSON DEFAULT '[]',
	`discovery_year` INTEGER DEFAULT NULL,
	`discovery` JSON DEFAULT '[]',
	`another_names` JSON DEFAULT '[]'
);

INSERT INTO element
(atomic_number, oficial_name, atomic_radius, category, atomic_mass, eletronegativity, `period`, family, symbol, fase, xpos, ypos, layers, electronic_configuration, oxidation_state, discovery_year, discovery, another_names, latin_name) VALUES
(                   1,  'hidrogênio',                   53,             'hidrogênio',              1.00794,                  2.1,                    1,                    1,                  'H', 'G',                    1,                    1,                 '[1]',                 NULL,                           '[]',                '[1]',                       'Do grego hydro (água) + genes (formador), significa \'formador de água\'.',                 1766, '1s1')
(                   2,       'hélio',                   31,              'gás nobre',             4.002602,                 NULL,                    1,                   18,                 'He', 'G',                   18,                    1,                 '[2]',                 NULL,                           '[]',                 '[]',                                  'Nome do deus do sol grego, pois foi detectado primeiro no Sol.',                 1868, '1s2')
(                   3,       'lítio',                  167,         'metal alcalino',                6.941,                 0.98,                    2,                    1,                 'Li', 'S',                    1,                    2,               '[2,1]',                 NULL,                           '[]',                '[1]',                      'Do grego lithos, que significa \'pedra\', pois foi encontrado em minerais.',                 1817, '1s2 2s1')
(                   4,     'berílio',                  112, 'metal alcalino terroso',             9.012182,                 1.57,                    2,                    2,                 'Be', 'S',                    2,                    2,               '[2,2]',                 NULL,                           '[]',                '[2]',                                                         'Derivado do mineral berilo, nome grego.',                 1797, '1s2 2s2')
(                   5,        'boro',                   87,              'semimetal',               10.811,                 2.04,                    2,                   13,                  'B', 'S',                   13,                    2,               '[2,3]',                 NULL,                           '[]',                 '[]',                                                          'Do árabe buraq, nome do mineral bórax.',                 1808, '1s2 2s2 2p1')
(                   6,     'carbono',                   67,                 'ametal',              12.0107,                 2.55,                    2,                   14,                  'C', 'S',                   14,                    2,               '[2,4]',                 NULL,                           '[]',               '[-2]',                                                       'Do latim carbo, que significa \'carvão\'.',                 1779, '1s2 2s2 2p2')
(                   7,  'nitrogênio',                   56,                 'ametal',              14.0067,                 3.04,                    2,                   15,                  'N', 'G',                   15,                    2,               '[2,5]',                 NULL,                    '["azoto"]',               '[-2]',                                  'Do grego nitro + genes, que significa \'formador de salitre\'.',                 1772, '1s2 2s2 2p3')
(                   8,    'oxigênio',                   48,                 'ametal',              15.9994,                 3.44,                    2,                   16,                  'O', 'G',                   16,                    2,               '[2,6]',                 NULL,                           '[]',               '[-2]',                                      'Do grego oxy + genes, que significa \'formador de ácido\'.',                 1774, '1s2 2s2 2p4')
(                   9,       'flúor',                   42,              'halogênio',           18.9984032,                 3.98,                    2,                   17,                  'F', 'G',                   17,                    2,               '[2,7]',                 NULL,                           '[]',               '[-1]',          'Do latim fluere, que significa \'fluir\', em referência à fluidez do mineral fluorita.',                 1886, '1s2 2s2 2p5')
(                  10,      'neônio',                   38,              'gás nobre',              20.1797,                 NULL,                    2,                   18,                 'Ne', 'G',                   18,                    2,               '[2,8]',                 NULL,                           '[]',                 '[]',                                                          'Do grego neos, que significa \'novo\'.',                 1898, '1s2 2s2 2p6')
(                  11,       'sódio',                  190,         'metal alcalino',             22.98977,                 0.93,                    3,                    1,                 'Na', 'S',                    1,                    3,             '[2,8,1]',            'natrium',                           '[]',                '[1]', 'Do inglês soda, derivado do italiano sida, e do egípcio natron, carbonato usado na mumificação.',                 1807, '1s2 2s2 2p6 3s1')
(                  12,    'magnésio',                  145, 'metal alcalino terroso',               24.305,                 1.31,                    3,                    2,                 'Mg', 'S',                    2,                    3,             '[2,8,2]',                 NULL,                           '[]',                '[2]',                                                  'Derivado da região da Grécia chamada Magnésia.',                 1755, '1s2 2s2 2p6 3s2')
(                  13,    'alumínio',                  118,          'outros metais',            26.981538,                 1.61,                    3,                   13,                 'Al', 'S',                   13,                    3,             '[2,8,3]',                 NULL,                           '[]',                '[3]',                                                  'Do latim alumen, que significa \'sal amargo\'.',                 1825, '1s2 2s2 2p6 3s2 3p1')
(                  14,     'silício',                  111,              'semimetal',              28.0855,                  1.9,                    3,                   14,                 'Si', 'S',                   14,                    3,             '[2,8,4]',                 NULL,                           '[]',                '[4]',                                             'Do latim silex ou silicis, que significa \'pedra\'.',                 1824, '1s2 2s2 2p6 3s2 3p2')
(                  15,     'fósforo',                   98,                 'ametal',            30.973761,                 2.19,                    3,                   15,                  'P', 'S',                   15,                    3,             '[2,8,5]',                 NULL,                           '[]',                 '[]',                                         'Do grego phosphorus, que significa \'portador de luz\'.',                 1669, '1s2 2s2 2p6 3s2 3p3')
(                  16,     'enxofre',                   88,                 'ametal',               32.065,                 2.58,                    3,                   16,                  'S', 'S',                   16,                    3,             '[2,8,6]',                 NULL,                           '[]',               '[-2]',                                                            'Do árabe as-sufr e do latim sulphur.',                 1869, '1s2 2s2 2p6 3s2 3p4')
(                  17,       'cloro',                   79,              'halogênio',               35.453,                 3.16,                    3,                   17,                 'Cl', 'G',                   17,                    3,             '[2,8,7]',                 NULL,                           '[]',               '[-1]',                                            'Do grego chlorós, que significa \'verde amarelado\'.',                 1774, '1s2 2s2 2p6 3s2 3p5')
(                  18,     'argônio',                   71,              'gás nobre',               39.948,                 NULL,                    3,                   18,                 'Ar', 'G',                   18,                    3,             '[2,8,8]',                 NULL,                           '[]',                 '[]',                                                      'Do grego argos, que significa \'inativo\'.',                 1894, '1s2 2s2 2p6 3s2 3p6')
(                  19,    'potássio',                  243,         'metal alcalino',              39.0983,                 0.82,                    4,                    1,                  'K', 'S',                    1,                    4,           '[2,8,8,1]',             'kalium',                           '[]',                '[1]',                                                                                'Do latim kalium.',                 1807, '1s2 2s2 2p6 3s2 3p6 4s1')
(                  20,      'cálcio',                  194, 'metal alcalino terroso',               40.078,                    1,                    4,                    2,                 'Ca', 'S',                    2,                    4,           '[2,8,8,2]',                 NULL,                           '[]',                '[2]',                                                'Do latim calx, que significa \'pedra calcária\'.',                 1808, '1s2 2s2 2p6 3s2 3p6 4s2')
(                  21,    'escândio',                  184,     'metal de transição',             44.95591,                 1.36,                    4,                    3,                 'Sc', 'S',                    3,                    4,           '[2,8,9,2]',                 NULL,                           '[]',                '[3]',                                                                       'Derivado da Escandinávia.',                 1879, '1s2 2s2 2p6 3s2 3p6 4s2 3d1')
(                  22,     'titânio',                  176,     'metal de transição',               47.867,                 1.54,                    4,                    4,                 'Ti', 'S',                    4,                    4,          '[2,8,10,2]',                 NULL,                           '[]',            '[2,3,4]',                                                              'Nome dos Titãs da mitologia grega.',                 1791, '1s2 2s2 2p6 3s2 3p6 4s2 3d2')
(                  23,     'vanádio',                  171,     'metal de transição',              50.9415,                 1.63,                    4,                    5,                  'V', 'S',                    5,                    4,          '[2,8,11,2]',                 NULL,                           '[]',          '[2,3,4,5]',                                       'Homenagem a Vanadis, deusa nórdica do amor e fertilidade.',                 1801, '1s2 2s2 2p6 3s2 3p6 4s2 3d3')
(                  24,       'cromo',                  166,     'metal de transição',              51.9961,                 1.66,                    4,                    6,                 'Cr', 'S',                    6,                    4,          '[2,8,13,1]',                 NULL,                           '[]',                '[3]',                                                         'Do grego chroma, que significa \'cor\'.',                 1797, '1s2 2s2 2p6 3s2 3p6 4s1 3d5')
(                  25,    'manganês',                  161,     'metal de transição',            54.938049,                 1.55,                    4,                    7,                 'Mn', 'S',                    7,                    4,          '[2,8,13,2]',                 NULL,                           '[]',        '[2,3,4,6,7]',                                                'Nome de origem incerta, confundido com magnésio.',                 1774, '1s2 2s2 2p6 3s2 3p6 4s2 3d5')
(                  26,       'ferro',                  156,     'metal de transição',               55.845,                 1.83,                    4,                    8,                 'Fe', 'S',                    8,                    4,          '[2,8,14,2]',             'ferrum',                           '[]',              '[2,3]',                                                                                'Do latim ferrum.',                 NULL, '1s2 2s2 2p6 3s2 3p6 4s2 3d6')
(                  27,     'cobalto',                  152,     'metal de transição',              58.9332,                 1.88,                    4,                    9,                 'Co', 'S',                    9,                    4,          '[2,8,15,2]',                 NULL,                           '[]',              '[2,3]',                                                    'Do alemão kobold, que significa \'demônio\'.',                 1735, '1s2 2s2 2p6 3s2 3p6 4s2 3d7')
(                  28,      'níquel',                  149,     'metal de transição',              58.6934,                 1.91,                    4,                   10,                 'Ni', 'S',                   10,                    4,          '[2,8,16,2]',                 NULL,                           '[]',        '[2,0,1,3,4]',                                       'Do alemão kupfernickel, que significa \'cobre do diabo\'.',                 1751, '1s2 2s2 2p6 3s2 3p6 4s2 3d8')
(                  29,       'cobre',                  145,     'metal de transição',               63.546,                  1.9,                    4,                   11,                 'Cu', 'S',                   11,                    4,          '[2,8,18,1]',             'cuprum',                           '[]',              '[2,1]',                                                                                'Do latim cuprum.',                 NULL, '1s2 2s2 2p6 3s2 3p6 4s1 3d10')
(                  30,       'zinco',                  142,     'metal de transição',               65.409,                 1.65,                    4,                   12,                 'Zn', 'S',                   12,                    4,          '[2,8,18,2]',                 NULL,                           '[]',                '[2]',                                                         'Derivado de minerais chamados calamina.',                 1746, '1s2 2s2 2p6 3s2 3p6 4s2 3d10')
(                  31,       'gálio',                  136,          'outros metais',               69.723,                 1.81,                    4,                   13,                 'Ga', 'S',                   13,                    4,          '[2,8,18,3]',                 NULL,                           '[]',                '[3]',                                                      'Derivado de Gallia, nome latino da França.',                 1875, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p1')
(                  32,    'germânio',                  125,              'semimetal',                72.64,                 2.01,                    4,                   14,                 'Ge', 'S',                   14,                    4,          '[2,8,18,4]',                 NULL,                           '[]',                '[4]',                                                  'Derivado da Germânia, nome latino da Alemanha.',                 1886, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p2')
(                  33,     'arsênio',                  114,              'semimetal',              74.9216,                 2.18,                    4,                   15,                 'As', 'S',                   15,                    4,          '[2,8,18,5]',                 NULL,                           '[]',         '[-3,0,3,5]',                                   'Do grego arsenikon, que significa \'masculino\' ou \'forte\'.',                 1250, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p3')
(                  34,     'selênio',                  103,                 'ametal',                78.96,                 2.55,                    4,                   16,                 'Se', 'S',                   16,                    4,          '[2,8,18,6]',                 NULL,                           '[]',               '[-2]',                                                         'Do grego selene, que significa \'lua\'.',                 1817, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p4')
(                  35,       'bromo',                   94,              'halogênio',               79.904,                 2.96,                    4,                   17,                 'Br', 'L',                   17,                    4,          '[2,8,18,7]',                 NULL,                           '[]',               '[-1]',                                                   'Do grego bromos, que significa \'odor ruim\'.',                 1826, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p5')
(                  36,   'criptônio',                   88,              'gás nobre',               83.798,                 NULL,                    4,                   18,                 'Kr', 'G',                   18,                    4,          '[2,8,18,8]',                 NULL,                           '[]',                 '[]',                                                     'Do grego kryptos, que significa \'oculto\'.',                 1898, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6')
(                  37,     'rubídio',                  265,         'metal alcalino',              85.4678,                 0.82,                    5,                    1,                 'Rb', 'S',                    1,                    5,        '[2,8,18,8,1]',                 NULL,                           '[]',                '[1]',                                                   'Do latim rubidus, que significa \'vermelho\'.',                 1861, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1')
(                  38,   'estrôncio',                  219, 'metal alcalino terroso',                87.62,                 0.95,                    5,                    2,                 'Sr', 'S',                    2,                    5,        '[2,8,18,8,2]',                 NULL,                           '[]',                '[2]',                                                          'Nome da vila de Strontian, na Escócia.',                 1790, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2')
(                  39,       'ítrio',                  212,     'metal de transição',             88.90585,                 1.22,                    5,                    3,                  'Y', 'S',                    3,                    5,        '[2,8,18,9,2]',                 NULL,                           '[]',                '[3]',                                                             'Nome da vila de Ytterby, na Suécia.',                 1794, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d1')
(                  40,    'zircônio',                  206,     'metal de transição',               91.224,                 1.33,                    5,                    4,                 'Zr', 'S',                    4,                    5,       '[2,8,18,10,2]',                 NULL,                           '[]',                '[4]',                                                                         'Nome do mineral zircão.',                 1789, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d2')
(                  41,      'nióbio',                  198,     'metal de transição',             92.90638,                  1.6,                    5,                    5,                 'Nb', 'S',                    5,                    5,       '[2,8,18,12,1]',                 NULL,                           '[]',                '[5]',                                                            'Nome da personagem mitológica Niobe.',                 1801, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d4')
(                  42,  'molibdênio',                  190,     'metal de transição',                95.94,                 2.16,                    5,                    6,                 'Mo', 'S',                    6,                    5,       '[2,8,18,13,1]',                 NULL,                           '[]',                '[6]',                                                    'Do grego molybdos, que significa \'chumbo\'.',                 1778, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d5')
(                  43,    'tecnécio',                  183,     'metal de transição',              97.9072,                  1.9,                    5,                    7,                 'Tc', 'S',                    7,                    5,       '[2,8,18,13,2]',                 NULL,                           '[]',                 '[]',                                               'Do grego technetos, que significa \'artificial\'.',                 1937, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d5')
(                  44,     'rutênio',                  178,     'metal de transição',               101.07,                  2.2,                    5,                    8,                 'Ru', 'S',                    8,                    5,       '[2,8,18,15,1]',                 NULL,                           '[]',                 '[]',                                                    'Derivado do nome latino da Rússia, Ruthenia.',                 1844, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d7')
(                  45,       'ródio',                  173,     'metal de transição',             102.9055,                 2.28,                    5,                    9,                 'Rh', 'S',                    9,                    5,       '[2,8,18,16,1]',                 NULL,                           '[]',                 '[]',                                                        'Do grego rhodon, que significa \'rosa\'.',                 1803, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d8')
(                  46,     'paládio',                  169,     'metal de transição',               106.42,                  2.2,                    5,                   10,                 'Pd', 'S',                   10,                    5,         '[2,8,18,18]',                 NULL,                           '[]',              '[2,4]',                                                                'Referência à deusa Pallas Atena.',                 1803, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 4d10')
(                  47,       'prata',                  165,     'metal de transição',             107.8682,                 1.93,                    5,                   11,                 'Ag', 'S',                   11,                    5,       '[2,8,18,18,1]',           'argentum',                           '[]',                '[1]',                                             'Do latim vulgar platta, que significa \'achatado\'.',                 NULL, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s1 4d10')
(                  48,      'cádmio',                  161,     'metal de transição',              112.411,                 1.69,                    5,                   12,                 'Cd', 'S',                   12,                    5,       '[2,8,18,18,2]',                 NULL,                           '[]',                '[2]',                                                                   'Derivado do minério calamina.',                 1817, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10')
(                  49,       'índio',                  156,          'outros metais',              114.818,                 1.78,                    5,                   13,                 'In', 'S',                   13,                    5,       '[2,8,18,18,3]',                 NULL,                           '[]',                 '[]',                                              'Referência à cor índigo emitida em espectroscopia.',                 1863, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p1')
(                  50,     'estanho',                  145,          'outros metais',               118.71,                 1.96,                    5,                   14,                 'Sn', 'S',                   14,                    5,       '[2,8,18,18,4]',            'stannum',                           '[]',                '[2]',                                                                               'Do latim stannum.',                 1765, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p2')
(                  51,   'antimônio',                  133,              'semimetal',               121.76,                 2.05,                    5,                   15,                 'Sb', 'S',                   15,                    5,       '[2,8,18,18,5]',            'stibium',                           '[]',                 '[]',                     'Do grego anti monos, que significa \'aquele que não é encontrado sozinho\'.',                 NULL, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p3')
(                  52,     'telúrio',                  123,              'semimetal',                127.6,                  2.1,                    5,                   16,                 'Te', 'S',                   16,                    5,       '[2,8,18,18,6]',                 NULL,                           '[]',               '[-2]',                                                       'Do latim tellus, que significa \'terra\'.',                 1782, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p4')
(                  53,        'iodo',                  115,              'halogênio',            126.90447,                 2.66,                    5,                   17,                  'I', 'S',                   17,                    5,       '[2,8,18,18,7]',                 NULL,                           '[]',               '[-1]',                                                      'Do grego iodes, que significa \'violeta\'.',                 1811, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p5')
(                  54,     'xenônio',                  108,              'gás nobre',              131.293,                  2.6,                    5,                   18,                 'Xe', 'G',                   18,                    5,       '[2,8,18,18,8]',                 NULL,                           '[]',                 '[]',                                                     'Do grego xenos, que significa \'estranho\'.',                 1898, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6')
(                  55,       'césio',                  298,         'metal alcalino',            132.90545,                 0.79,                    6,                    1,                 'Cs', 'S',                    1,                    6,     '[2,8,18,18,8,1]',                 NULL,                           '[]',                '[1]',                                               'Do latim caesius, que significa \'azul celeste\'.',                 1860, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s1')
(                  56,       'bário',                  253, 'metal alcalino terroso',              137.327,                 0.89,                    6,                    2,                 'Ba', 'S',                    2,                    6,     '[2,8,18,18,8,2]',                 NULL,                           '[]',                '[2]',                                                       'Do grego barys, que significa \'pesado\'.',                 1808, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2')
(                  57,    'lantânio',                 NULL,             'lantanídeo',             138.9055,                  1.1,                    6,                    3,                 'La', 'S',                    4,                    9,     '[2,8,18,18,9,2]',                 NULL,                           '[]',                '[3]',                                             'Do grego lanthanein, que significa \'esconder-se\'.',                 1839, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 5d1')
(                  58,       'cério',                 NULL,             'lantanídeo',              140.116,                 1.12,                    6,                    3,                 'Ce', 'S',                    5,                    9,     '[2,8,18,19,9,2]',                 NULL,                           '[]',                '[3]',                                                                        'Nome do asteroide Ceres.',                 1803, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 5d1 4f1')
(                  59, 'praseodímio',                  247,             'lantanídeo',            140.90765,                 1.13,                    6,                    3,                 'Pr', 'S',                    6,                    9,     '[2,8,18,21,8,2]',                 NULL,                           '[]',                 '[]',                                                     'Do grego prasios (verde) + didymos (gêmeo).',                 1885, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f3')
(                  60,    'neodímio',                  206,             'lantanídeo',               144.24,                 1.14,                    6,                    3,                 'Nd', 'S',                    7,                    9,     '[2,8,18,22,8,2]',                 NULL,                           '[]',                '[4]',                                                         'Do grego neos (novo) + didymos (gêmeo).',                 1885, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f4')
(                  61,    'promécio',                  205,             'lantanídeo',             144.9127,                 1.13,                    6,                    3,                 'Pm', 'S',                    8,                    9,     '[2,8,18,23,8,2]',                 NULL,                           '[]',                '[3]',               'Derivado de Prometeu, personagem da mitologia grega que roubou o fogo dos deuses.',                 1945, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f5')
(                  62,     'samário',                  238,             'lantanídeo',               150.36,                 1.17,                    6,                    3,                 'Sm', 'S',                    9,                    9,     '[2,8,18,24,8,2]',                 NULL,                           '[]',              '[3,2]',                                       'Nome derivado do mineral samarskita, onde foi encontrado.',                 1879, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f6')
(                  63,     'európio',                  231,             'lantanídeo',              151.964,                  1.2,                    6,                    3,                 'Eu', 'S',                   10,                    9,     '[2,8,18,25,8,2]',                 NULL,                           '[]',                '[3]',                                         'Nome derivado da Europa, personagem da mitologia grega.',                 1901, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f7')
(                  64,   'gadolínio',                  233,             'lantanídeo',               157.25,                  1.2,                    6,                    3,                 'Gd', 'S',                   11,                    9,     '[2,8,18,25,9,2]',                 NULL,                           '[]',                '[3]',                                           'Nome em homenagem ao químico finlandês Johan Gadolin.',                 1880, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f7 5d1')
(                  65,      'térbio',                  225,             'lantanídeo',            158.92534,                  1.1,                    6,                    3,                 'Tb', 'S',                   12,                    9,     '[2,8,18,27,8,2]',                 NULL,                           '[]',                 '[]',                           'Nome derivado da vila de Ytterby, na Suécia, como outros lantanídeos.',                 1843, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f9')
(                  66,   'disprósio',                  228,             'lantanídeo',                162.5,                 1.22,                    6,                    3,                 'Dy', 'S',                   13,                    9,     '[2,8,18,28,8,2]',                 NULL,                           '[]',                '[3]',                                       'Do grego dysprositos, que significa \'difícil de obter\'.',                 1886, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f10')
(                  67,      'hólmio',                 NULL,             'lantanídeo',            164.93032,                 1.23,                    6,                    3,                 'Ho', 'S',                   14,                    9,     '[2,8,18,29,8,2]',                 NULL,                           '[]',                 '[]',                                    'Nome derivado de Holmia, nome latino para Estocolmo, Suécia.',                 1878, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f11')
(                  68,       'érbio',                  226,             'lantanídeo',              167.259,                 1.24,                    6,                    3,                 'Er', 'S',                   15,                    9,     '[2,8,18,30,8,2]',                 NULL,                           '[]',                 '[]',                                                    'Nome derivado da vila de Ytterby, na Suécia.',                 1843, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f12')
(                  69,       'túlio',                  222,             'lantanídeo',            168.93421,                 1.25,                    6,                    3,                 'Tm', 'S',                   16,                    9,     '[2,8,18,31,8,2]',                 NULL,                           '[]',                 '[]',                                    'Nome derivado de Thule, nome antigo para uma região nórdica.',                 1879, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f13')
(                  70,     'itérbio',                  222,             'lantanídeo',               173.04,                  1.1,                    6,                    3,                 'Yb', 'S',                   17,                    9,     '[2,8,18,32,8,2]',                 NULL,                           '[]',                 '[]',                                                    'Nome derivado da vila de Ytterby, na Suécia.',                 1878, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14')
(                  71,     'lutécio',                  217,             'lantanídeo',              174.967,                 1.27,                    6,                    3,                 'Lu', 'S',                   18,                    9,     '[2,8,18,32,9,2]',                 NULL,                           '[]',                 '[]',                                               'Nome derivado de Lutetia, nome romano para Paris.',                 1907, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d1')
(                  72,      'háfnio',                  208,     'metal de transição',               178.49,                  1.3,                    6,                    4,                 'Hf', 'S',                    4,                    6,    '[2,8,18,32,10,2]',                 NULL,                           '[]',                '[4]',                                           'Nome derivado de Hafnia, nome latino para Copenhague.',                 1923, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d2')
(                  73,     'tântalo',                  200,     'metal de transição',             180.9479,                  1.5,                    6,                    5,                 'Ta', 'S',                    5,                    6,    '[2,8,18,32,11,2]',                 NULL,                           '[]',                '[3]',                   'Nome derivado do personagem mitológico Tântalo, que sofreu tormentos eternos.',                 1802, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d3')
(                  74,  'tungstênio',                  193,     'metal de transição',               183.84,                 2.36,                    6,                    6,                  'W', 'S',                    6,                    6,    '[2,8,18,32,12,2]',            'wolfram',                           '[]',              '[4,6]',                                             'Do sueco tung sten, que significa \'pedra pesada\'.',                 1783, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d4')
(                  75,       'rênio',                  188,     'metal de transição',              186.207,                  1.9,                    6,                    7,                 'Re', 'S',                    7,                    6,    '[2,8,18,32,13,2]',                 NULL,                           '[]',                 '[]',                                                           'Nome derivado do rio Reno, na Europa.',                 1925, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d5')
(                  76,       'ósmio',                  185,     'metal de transição',               190.23,                  2.2,                    6,                    8,                 'Os', 'S',                    8,                    6,    '[2,8,18,32,14,2]',                 NULL,                           '[]',              '[4,3]',                   'Do grego osme, que significa \'odor\', referindo-se ao cheiro forte do ósmio.',                 1803, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d6')
(                  77,      'irídio',                  180,     'metal de transição',              192.217,                  2.2,                    6,                    9,                 'Ir', 'S',                    9,                    6,    '[2,8,18,32,15,2]',                 NULL,                           '[]',                 '[]',              'Do latim iris, que significa \'arco-íris\', pela variedade de cores dos compostos.',                 1803, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d7')
(                  78,     'platina',                  177,     'metal de transição',              195.078,                 2.28,                    6,                   10,                 'Pt', 'S',                   10,                    6,    '[2,8,18,32,17,1]',                 NULL,                           '[]',                '[2]',                                          'Diminutivo espanhol de plata, que significa \'prata\'.',                 1735, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s1 4f14 5d9')
(                  79,        'ouro',                  174,     'metal de transição',            196.96655,                 2.54,                    6,                   11,                 'Au', 'S',                   11,                    6,    '[2,8,18,32,18,1]',              'aurum',                           '[]',              '[3,1]',                         'Do latim aurum, que significa \'brilhante amanhecer\' ou \'brilhante\'.',                 1695, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s1 4f14 5d10')
(                  80,    'mercúrio',                  171,     'metal de transição',               200.59,                    2,                    6,                   12,                 'Hg', 'L',                   12,                    6,    '[2,8,18,32,18,2]',        'hydrargyrum',                           '[]',            '[2,1,0]',                                            'Nome do deus romano Mercúrio, mensageiro dos deuses.',                 NULL, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10')
(                  81,       'tálio',                  156,          'outros metais',             204.3833,                 2.04,                    6,                   13,                 'Tl', 'S',                   13,                    6,    '[2,8,18,32,18,3]',                 NULL,                           '[]',                 '[]',                                                'Do grego thallos, que significa \'broto verde\'.',                 1861, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p1')
(                  82,      'chumbo',                  154,          'outros metais',                207.2,                 2.33,                    6,                   14,                 'Pb', 'S',                   14,                    6,    '[2,8,18,32,18,4]',            'plumbum',                           '[]',              '[2,4]',                                                                               'Do latim plumbum.',                 NULL, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p2')
(                  83,     'bismuto',                  143,          'outros metais',            208.98038,                 2.02,                    6,                   15,                 'Bi', 'S',                   15,                    6,    '[2,8,18,32,18,5]',                 NULL,                           '[]',             '[3,-3]',                               'Possível origem do alemão wismut, que significa \'metal branco\'.',                 1753, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p3')
(                  84,     'polônio',                  135,          'outros metais',             208.9824,                    2,                    6,                   16,                 'Po', 'S',                   16,                    6,    '[2,8,18,32,18,6]',                 NULL,                           '[]',           '[-2,2,4]',                                        'Nome em homenagem à Polônia, terra natal de Marie Curie.',                 1898, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p4')
(                  85,   'astatínio',                 NULL,              'halogênio',             209.9871,                  2.2,                    6,                   17,                 'At', 'S',                   17,                    6,    '[2,8,18,32,18,7]',                 NULL,                           '[]',               '[-1]',                                                   'Do grego astatos, que significa \'instável\'.',                 1940, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p5')
(                  86,     'radônio',                  120,              'gás nobre',             222.0176,                 NULL,                    6,                   18,                 'Rn', 'G',                   18,                    6,    '[2,8,18,32,18,8]',                 NULL,                           '[]',                 '[]',                                    'Derivado do rádio, elemento do qual é produto de decaimento.',                 1900, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6')
(                  87,     'frâncio',                  270,         'metal alcalino',             223.0197,                  0.7,                    7,                    1,                 'Fr', 'S',                    1,                    7,  '[2,8,18,32,18,8,1]',                 NULL,                           '[]',                '[1]',                                                                     'Nome em homenagem à França.',                 1939, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s1')
(                  88,       'rádio',                 NULL, 'metal alcalino terroso',             226.0254,                 0.89,                    7,                    2,                 'Ra', 'S',                    2,                    7,  '[2,8,18,32,18,8,2]',                 NULL,                           '[]',                '[2]',                                                        'Do latim radius, que significa \'raio\'.',                 1898, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2')
(                  89,     'actínio',                 NULL,              'actinídeo',             227.0277,                  1.1,                    7,                    3,                 'Ac', 'S',                    4,                   10,  '[2,8,18,32,18,9,2]',                 NULL,                           '[]',                '[3]',                                          'Do grego aktinos, que significa \'raio\' ou \'feixe\'.',                 1899, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 6d1')
(                  90,       'tório',                 NULL,              'actinídeo',             232.0381,                  1.3,                    7,                    3,                 'Th', 'S',                    5,                   10, '[2,8,18,32,18,10,2]',                 NULL,                           '[]',                '[4]',                                                         'Nome em homenagem ao deus nórdico Thor.',                 1828, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 6d2')
(                  91, 'protactínio',                 NULL,              'actinídeo',            231.03588,                  1.5,                    7,                    3,                 'Pa', 'S',                    6,                   10,  '[2,8,18,32,20,9,2]',                 NULL,                           '[]',                '[5]',                                         'Do grego protos, que significa \'primeiro\', e actínio.',                 1913, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f2 6d1')
(                  92,      'urânio',                 NULL,              'actinídeo',            238.02891,                 1.38,                    7,                    3,                  'U', 'S',                    7,                   10,  '[2,8,18,32,21,9,2]',                 NULL,                           '[]',          '[3,4,5,6]',                                                             'Nome em homenagem ao planeta Urano.',                 1789, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f3 6d1')
(                  93,     'netúnio',                 NULL,              'actinídeo',             237.0482,                 1.36,                    7,                    3,                 'Np', 'S',                    8,                   10,  '[2,8,18,32,22,9,2]',                 NULL,                           '[]',                 '[]',                                                            'Nome em homenagem ao planeta Netuno.',                 1940, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f4 6d1')
(                  94,    'plutônio',                 NULL,              'actinídeo',             244.0642,                 1.28,                    7,                    3,                 'Pu', 'S',                    9,                   10,  '[2,8,18,32,24,8,2]',                 NULL,                           '[]',        '[3,4,5,6,7]',                                                            'Nome em homenagem ao planeta Plutão.',                 1940, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f6')
(                  95,    'amerício',                 NULL,              'actinídeo',             243.0614,                  1.3,                    7,                    3,                 'Am', 'S',                   10,                   10,  '[2,8,18,32,25,8,2]',                 NULL,                           '[]',                 '[]',                                                      'Nome em homenagem ao continente americano.',                 1944, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f7')
(                  96,       'cúrio',                 NULL,              'actinídeo',             247.0704,                  1.3,                    7,                    3,                 'Cm', 'S',                   11,                   10,  '[2,8,18,32,25,9,2]',                 NULL,                           '[]',                 '[]',                                                 'Nome em homenagem a Marie Curie e Pierre Curie.',                 1944, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f7 6d1')
(                  97,   'berquélio',                 NULL,              'actinídeo',             247.0703,                  1.3,                    7,                    3,                 'Bk', 'S',                   12,                   10,  '[2,8,18,32,27,8,2]',                 NULL,                           '[]',              '[3,4]',              'Nome em homenagem a Pierre Curie e Marie Curie, cujo nome de solteira era Berquel.',                 1949, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f9')
(                  98,  'califórnio',                 NULL,              'actinídeo',             251.0796,                  1.3,                    7,                    3,                 'Cf', 'S',                   13,                   10,  '[2,8,18,32,28,8,2]',                 NULL,                           '[]',                 '[]',                                                 'Nome em homenagem ao estado da Califórnia, EUA.',                 1950, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f10')
(                  99,  'einstéinio',                 NULL,              'actinídeo',              252.083,                  1.3,                    7,                    3,                 'Es', 'S',                   14,                   10,  '[2,8,18,32,29,8,2]',                 NULL,                           '[]',                 '[]',                                                                                              NULL,                 1952, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f11')
(                 100,      'férmio',                 NULL,              'actinídeo',             257.0951,                  1.3,                    7,                    3,                 'Fm', 'S',                   15,                   10,  '[2,8,18,32,30,8,2]',                 NULL,                           '[]',                 '[]',                                                               'Nome em homenagem a Enrico Fermi.',                 1953, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f12')
(                 101,  'mendelévio',                 NULL,              'actinídeo',             258.0984,                  1.3,                    7,                    3,                 'Md', 'S',                   16,                   10,  '[2,8,18,32,31,8,2]',                 NULL,                           '[]',                 '[]',                                                          'Nome em homenagem a Dmitri Mendeléyev.',                 1955, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f13')
(                 102,     'nobélio',                 NULL,              'actinídeo',              259.101,                  1.3,                    7,                    3,                 'No', 'S',                   17,                   10,  '[2,8,18,32,32,8,2]',                 NULL,                           '[]',                 '[]',                                                               'Nome em homenagem a Alfred Nobel.',                 1958, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14')
(                 103,   'laurêncio',                 NULL,              'actinídeo',             262.1097,                 NULL,                    7,                    3,                 'Lr', 'S',                   18,                   10,  '[2,8,18,32,32,8,3]',                 NULL,                           '[]',                 '[]',                                             'Nome em homenagem ao Laboratório Lawrence Berkeley.',                 1961, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 7p1')
(                 104,'rutherfórdio',                 NULL,     'metal de transição',             261.1088,                 NULL,                    7,                    4,                 'Rf', 'S',                    4,                    7, '[2,8,18,32,32,10,2]',                 NULL,                           '[]',                 '[]',                                                          'Nome em homenagem a Ernest Rutherford.',                 1964, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d2')
(                 105,      'dúbnio',                 NULL,     'metal de transição',             262.1141,                 NULL,                    7,                    5,                 'Db', 'S',                    5,                    7, '[2,8,18,32,32,11,2]',                 NULL,                           '[]',                 '[]',                                                    'Nome em homenagem à cidade de Dubna, Rússia.',                 1967, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d3')
(                 106,   'seabórgio',                 NULL,     'metal de transição',             266.1219,                 NULL,                    7,                    6,                 'Sg', 'S',                    6,                    7, '[2,8,18,32,32,12,2]',                 NULL,                           '[]',                 '[]',                                                           'Nome em homenagem a Glenn T. Seaborg.',                 1974, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d4')
(                 107,      'bóhrio',                 NULL,     'metal de transição',               264.12,                 NULL,                    7,                    7,                 'Bh', 'S',                    7,                    7, '[2,8,18,32,32,13,2]',                 NULL,                           '[]',                 '[]',                                                                 'Nome em homenagem a Niels Bohr.',                 1981, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d5')
(                 108,      'hássio',                 NULL,     'metal de transição',                  277,                 NULL,                    7,                    8,                 'Hs', 'S',                    8,                    7, '[2,8,18,32,32,14,2]',                 NULL,                           '[]',                 '[]',                                                        'Nome derivado do estado alemão de Hesse.',                 1984, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d6')
(                 109,   'meitnério',                 NULL,           'desconhecido',             268.1388,                 NULL,                    7,                    9,                 'Mt', 'S',                    9,                    7, '[2,8,18,32,32,15,2]',                 NULL,                           '[]',                 '[]',                                                               'Nome em homenagem a Lise Meitner.',                 1982, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d7')
(                 110, 'darmstadtio',                 NULL,           'desconhecido',                  281,                 NULL,                    7,                   10,                 'Ds', 'S',                   10,                    7, '[2,8,18,32,32,16,2]',                 NULL,                           '[]',                 '[]',                                              'Nome em homenagem à cidade de Darmstadt, Alemanha.',                 1994, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d8')
(                 111,  'roentgénio',                 NULL,           'desconhecido',             272.1535,                 NULL,                    7,                   11,                 'Rg', 'S',                   11,                    7, '[2,8,18,32,32,17,2]',                 NULL,                           '[]',                 '[]',                                                                                              NULL,                 1994, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d9')
(                 112,  'copernício',                 NULL,     'metal de transição',                  285,                 NULL,                    7,                   12,                 'Cn', 'L',                   12,                    7, '[2,8,18,32,32,18,2]',                 NULL,                           '[]',                 '[]',                                                          'Nome em homenagem a Nicolau Copérnico.',                 1996, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10')
(                 113,     'nihônio',                 NULL,           'desconhecido',                  286,                 NULL,                    7,                   13,                 'Nh', 'S',                   13,                    7, '[2,8,18,32,32,18,3]',                 NULL,                           '[]',                 '[]',                                                                 'Nome derivado do Japão (Nihon).',                 2003, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p1')
(                 114,    'fleróvio',                 NULL,          'outros metais',                  289,                 NULL,                    7,                   14,                 'Fl', 'S',                   14,                    7, '[2,8,18,32,32,18,4]',                 NULL,                           '[]',                 '[]',                                                  'Nome em homenagem à região de Fléron, Bélgica.',                 1998, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p2')
(                 115,    'moscóvio',                 NULL,           'desconhecido',                  289,                 NULL,                    7,                   15,                 'Mc', 'S',                   15,                    7, '[2,8,18,32,32,18,5]',                 NULL,                           '[]',                 '[]',                                                             'Nome em homenagem a Moscou, Rússia.',                 2003, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p3')
(                 116,  'livermório',                 NULL,           'desconhecido',                  289,                 NULL,                    7,                   16,                 'Lv', 'S',                   16,                    7, '[2,8,18,32,32,18,6]',                 NULL,                           '[]',                 '[]',                                   'Nome em homenagem ao Laboratório Nacional Lawrence Livermore.',                 2000, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p4')
(                 117,     'tenesso',                 NULL,           'desconhecido',                  294,                 NULL,                    7,                   17,                 'Ts', 'S',                   17,                    7, '[2,8,18,32,32,18,7]',                 NULL,                           '[]',                 '[]',                                                  'Nome em homenagem ao estado do Tennessee, EUA.',                 2010, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p5')
(                 118, 'oganessônio',                 NULL,           'desconhecido',                  294,                 NULL,                    7,                   18,                 'Og', 'S',                   18,                    7, '[2,8,18,32,32,18,8]',                 NULL,                           '[]',                 '[]',                                                            'Nome em homenagem a Yuri Oganessian.',                 2002, '1s2 2s2 2p6 3s2 3p6 4s2 3d10 4p6 5s2 4d10 5p6 6s2 4f14 5d10 6p6 7s2 5f14 6d10 7p6')
;

CREATE TABLE molecula (
  id INTEGER PRIMARY KEY,
  uid TEXT NOT NULL,
  name TEXT NOT NULL,
  z1 TEXT DEFAULT NULL,
  term TEXT NOT NULL,
  another_names TEXT DEFAULT '[]'
);

INSERT INTO molecula (uid, name, z1, term, another_names)
VALUES
('0474a238-6a44-408f-b393-adfaeb0d2e05', 'carbonato de cálcio', '@name carbonato de cálcio
@tag inorgânico

@p trigonal_plana 1,2,3
C 1 2 3 4
O 1
1 =
O -1 2
O -1 3

4 i; 210°
Ca +2 4', 'CCaOOO', '[]'),('a12ba0bf-9025-43f5-9fd1-a9be679d0338', 'capsaicina', '@name capsaicina
@tag orgânico
@tag hidrocarboneto

@p benzeno 1,2,3,4,5,6,7,8,9,10,11,12
H 7
O 8 13
@p hidroxila 9,17
H 10
H 11
@p CHHup 12,18,19,20

C 13 14 15 16
H 14
14 [60° 30°]
H 15
15 [60° 150°]
H 16
16 [150° 90°]

N 20 21 22
H 21
21 [180° 0°]

C 22 23 24
O 23
22 210°
23 = 0° [0° 0°]
@p CHHdown 24,25,26,27
@p CHHup 27,28,29,30
@p CHHdown 30,31,32,33
@p CHHup 33,34,35,36
C 36 37 38
H 37
37 90°
C 38 39 40
38 210°
H 39
39 270°
C 40 41 42 49
40 150°

H 49
49 0° [120° 0°]

41 90° [240° 0°]
C 41 43 44 45
H 43
43 [90° 240°]
H 44
44 [90° 120°]
H 45
45 [210° 180°]

42 210°
C 42 46 47 48
H 46
46 150°
H 47
47 [60° 0°]
H 48
48 [60° 180°]', 'CCCCCCCCCCCCCCCCCCHHHHHHHHHHHHHHHHHHHHHHHHHHHNOOO', '[]'),('68b30456-6359-41e5-b7e4-92a769317028', 'amônia', '@name amônia
@tag inorgânico

@p piramidal 1,2,3
N 1 2 3
H 1
H 2
H 3', 'HHHN', '[]'),('278729fc-2856-407e-9a6d-403615230aa7', 'aspartato', '@name aspartato

@tag orgânico
@p acido_carboxilico 1,2,3,4
2 90°
3 210°
4 180° [240° 90°]
@p CHHup 1,5,6,7
7 30°
C 7 8 9 12
8 120°
H 8
9 60°
N 9 10 11
@p HHdown 10,11
10 60° [120° 0°]
11 120° [120° 180°]
@p acido_carboxilico 12,13,14,15
12 330°
13 270° [0° 0°]
14 30° [120° 90°]
15 0° [60° 90°]', 'CCCCHHHHHHHNOOOO', '[]'),('620b9b06-4b64-4a7b-898e-9460e5536529', 'água', '@name água
@tag inorgânico

@p angular 1,2
O 1 2
H 1
H 2', 'HHO', '[]'),('cc4e22a2-7edc-4c20-aad7-dce66e026ddf', 'tetrafluoretileno', '@name tetrafluoretileno

@name teflon

@tag inorgânico

C 1 2 3
C 1 4 5
1 =
F 2
F 3
F 4
F 5

2 240°
3 120°
4 60°
5 300°', 'CCFFFF', '["teflon"]'),('70b0f449-772a-4d25-989c-61d011e932fa', 'benzeno', '@name benzeno

@tag orgânico
@tag hidrocarboneto

@p benzeno 1,2,3,4,5,6,7,8,9,10,11,12

H 7
H 8
H 9
H 10
H 11
H 12', 'CCCCCCHHHHHH', '[]'),('1c37f2c9-194f-44ec-b876-c73927857bcc', 'ácido nítrico', '@name ácido nítrico
@tag inorgânico
@p trigonal_plana 1,2,3
N 1 2 3
O 1
1 =
O 2 4
O 3

4 [60° 90°]
H 4', 'HNOOO', '[]'),('b0c8c145-4668-44d1-91f3-b8ff05eff885', 'fenol', '@name fenol

@p benzeno 1,2,3,4,5,6,7,8,9,10,11,12
H 7
H 9
H 10
H 11
H 12
@p hidroxila 8,13
13 0°', 'CCCCCCHHHHHHO', '[]'),('1124601f-5e97-49a3-a321-234c2d63dfec', 'metano', '@name metano
@tag orgânico

@p tetraedrica 1,2,3,4
C 1 2 3 4
H 1
H 2
H 3
H 4', 'CHHHH', '[]'),('8715721c-b8d2-4007-bd66-cfa25d2e5849', 'ácido cítrico', '@name ácido cítrico
@tag orgânico
@p tetraedrica 2,1,3,4
C 1 2 3 4
O 1 5
H 5
5 [60° 0°]
C 2 6 7
O 6
6 = 180° [300° 90°]
O 7 8
7 [60° 90°]
H 8
8 [60° 30°]

@p CHHdown 4,9,10,11
C 11 12 13
O 12
12 = [0° 0°]
O 13 14
13 [120° 270°]
H 14
14 [30° 270°]

@p CHHdown 3,15,16,17
17 [60° 120°]
C 17 18 19
O 18
18 = [0° 0°]
O 19 20
19 [120° 90°]
H 20
20 [300° 270°]', 'CCCCCCHHHHHHHHOOOOOOO', '[]'),('3f139ae0-c3ce-40e9-9c7e-5d121acb8630', 'ácido sulfúrico', '@name ácido sulfúrico

@tag ácido
@tag oxiácido
@tag inorgânico

@p tetraedrica 1,2,3,4
S 1 2 3 4
O 1 5
O 2
O 3 6
O 4

2 =
4 =

H 5
H 6
5 0° [30° 0°]
6 180° [120° 60°]', 'HHOOOOS', '[]'),('f47520db-4b5e-4c2a-b9fc-2f49d1073213', 'cinamaldeído', '@name cinamaldeído
@tag orgânico
@tag hidrocarboneto

@p benzeno 1,2,3,4,5,6,7,8,9,10,11,12
H 7
H 9
H 10
H 11
H 12

C 8 14 15
H 14
14 270°
15 =

C 15 16 17
H 16
15 30°
16 90°
17 330°

@p aldeido 17,18,19', 'CCCCCCCCCHHHHHHHHO', '[]'),('b9c65218-c1ed-431e-9762-8617cb2bceb2', 'bicarbonato de sódio', '@name bicarbonato de sódio
@tag inorgânico
@p trigonal_plana 1,2,3
C 1 2 3
O 1
1 =
O 2 4
O 3 5

4 [60° 90°]
H 4

5 i; [60° 270°]
Na 5', 'CHNaOOO', '[]'),('3dbc345a-1598-41ee-86e8-8c8bb31f4d09', 'trifluoreto de boro', '@name trifluoreto de boro
@tag inorgânico

@p trigonal_plana 1,2,3

B 1 2 3
F 1
F 2
F 3', 'BFFF', '[]'),('495f7176-9d39-4af8-90c4-8dfd7ae6d42a', 'bis-2-(cloroétil)tioéter', '@name bis-2-(cloroétil)tioéter
@tag orgânico

S 1 2
@p CHHup 1,3,4,5
@p CHHdown 5,6,7,8
Cl 8
@p CHHup 2,9,10,11
2 330°
@p CHHdown 11,12,13,14
11 30°
14 330°
Cl 14', 'CCCCClClHHHHHHHHS', '[]');