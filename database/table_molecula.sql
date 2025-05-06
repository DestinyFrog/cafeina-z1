
CREATE TABLE molecula (
  `id` INTEGER PRIMARY KEY,
  `uid` TEXT NOT NULL,
  `name` TEXT NOT NULL,
  `z1` TEXT DEFAULT NULL,
  `term` TEXT NOT NULL,
  `another_names` TEXT DEFAULT '[]'
);

INSERT INTO molecula (`uid`, `name`, `z1`, `term`, `another_names`)
VALUES
('07852c3e-9880-4004-a47b-360354bfd9c6', 'trifluoreto de boro', '@name trifluoreto de boro
@tag inorgânico

@p trigonal_plana 1,2,3

B 1 2 3
F 1
F 2
F 3', 'BFFF', '[]')
,('7bac3685-5ba0-42fd-aa5a-d45f0cbb8b42', 'aspartato', '@name aspartato

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
15 0° [60° 90°]', 'CCCCHHHHHHHNOOOO', '[]')
,('7c68bf10-edd1-4d8e-97c6-60d769fc7c90', 'metano', '@name metano
@tag orgânico

@p tetraedrica 1,2,3,4
C 1 2 3 4
H 1
H 2
H 3
H 4', 'CHHHH', '[]')
,('34718e80-58bf-44be-b005-9560731971c0', 'ácido sulfúrico', '@name ácido sulfúrico

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
6 180° [120° 60°]', 'HHOOOOS', '[]')
,('6584ee7d-238f-4f7e-bbc0-232a1d23e63d', 'benzeno', '@name benzeno

@tag orgânico
@tag hidrocarboneto

@p benzeno 1,2,3,4,5,6,7,8,9,10,11,12

H 7
H 8
H 9
H 10
H 11
H 12', 'CCCCCCHHHHHH', '[]')
,('84aff6c0-2d05-45dd-99ca-ee844c31fd33', 'ácido nítrico', '@name ácido nítrico
@tag inorgânico
@p trigonal_plana 1,2,3
N 1 2 3
O 1
1 =
O 2 4
O 3

4 [60° 90°]
H 4', 'HNOOO', '[]')
,('a41a3749-6976-4acd-a8ff-14a85fbd6527', 'bicarbonato de sódio', '@name bicarbonato de sódio
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
Na 5', 'CHNaOOO', '[]')
,('d2389bd8-4b79-4439-bfd2-61c18983a271', 'tetrafluoretileno', '@name tetrafluoretileno

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
5 300°', 'CCFFFF', '["teflon"]')
,('ef86d121-a0de-48e5-9a72-398b5c4ea588', 'capsaicina', '@name capsaicina
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
48 [60° 180°]', 'CCCCCCCCCCCCCCCCCCHHHHHHHHHHHHHHHHHHHHHHHHHHHNOOO', '[]')
,('e07d4d81-231b-4324-83cc-6ad49b42cb8c', 'amônia', '@name amônia
@tag inorgânico

@p piramidal 1,2,3
N 1 2 3
H 1
H 2
H 3', 'HHHN', '[]')
,('92b7fa80-ed8f-406f-9343-c1b858cb8d21', 'carbonato de cálcio', '@name carbonato de cálcio
@tag inorgânico

@p trigonal_plana 1,2,3
C 1 2 3 4
O 1
1 =
O -1 2
O -1 3

4 i; 210°
Ca +2 4', 'CCaOOO', '[]')
,('21f51087-33d8-47da-a1a8-055560d48350', 'ácido cítrico', '@name ácido cítrico
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
20 [300° 270°]', 'CCCCCCHHHHHHHHOOOOOOO', '[]')
,('d5933a31-8cf6-4699-9805-fedc3f003ab9', 'cinamaldeído', '@name cinamaldeído
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

@p aldeido 17,18,19', 'CCCCCCCCCHHHHHHHHO', '[]')
,('1d68ebde-8b07-4817-8fcc-8049004758bf', 'fenol', '@name fenol

@p benzeno 1,2,3,4,5,6,7,8,9,10,11,12
H 7
H 9
H 10
H 11
H 12
@p hidroxila 8,13
13 0°', 'CCCCCCHHHHHHO', '[]')
,('5f87ce5a-dfc1-4270-8d89-3edb32b17092', 'água', '@name água
@tag inorgânico

@p angular 1,2
O 1 2
H 1
H 2', 'HHO', '[]')
,('543a92c8-5a7a-4008-9083-63de8b4213f9', 'bis-2-(cloroétil)tioéter', '@name bis-2-(cloroétil)tioéter
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