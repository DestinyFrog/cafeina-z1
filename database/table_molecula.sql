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
('5297e333-d2d2-4aa2-9fab-35ff0334e413', 'trifluoreto de boro', '@name trifluoreto de boro
@tag inorgânico

@p trigonal_plana 1,2,3

B 1 2 3
F 1
F 2
F 3', 'BFFF', '[]'),('cbf9ef00-0739-46cc-b181-76c551e93321', 'metano', '@name metano
@tag orgânico

@p tetraedrica 1,2,3,4
C 1 2 3 4
H 1
H 2
H 3
H 4', 'CHHHH', '[]'),('a2418f49-8432-47f0-a674-3a712d7afbf6', 'ácido sulfúrico', '@name ácido sulfúrico

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
6 180° [120° 60°]', 'HHOOOOS', '[]'),('7591a50b-44e3-4b37-b5ef-fabc3750fb78', 'benzeno', '@name benzeno

@tag orgânico
@tag hidrocarboneto

@p benzeno 1,2,3,4,5,6,7,8,9,10,11,12

H 7
H 8
H 9
H 10
H 11
H 12', 'CCCCCCHHHHHH', '[]'),('fc450354-1d79-44d5-828f-6d38631dda83', 'ácido nítrico', '@name ácido nítrico
@tag inorgânico
@p trigonal_plana 1,2,3
N 1 2 3
O 1
1 =
O 2 4
O 3

4 [60° 90°]
H 4', 'HNOOO', '[]'),('2602c6e8-31f3-4272-937d-85d31fb58284', 'bicarbonato de sódio', '@name bicarbonato de sódio
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
Na 5', 'CHNaOOO', '[]'),('afe5624a-82b9-4860-9691-99255b9c1828', 'tetrafluoretileno', '@name tetrafluoretileno

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
5 300°', 'CCFFFF', '["teflon"]'),('e22b0db8-bb16-4fba-b145-04dc4bae5d32', 'amônia', '@name amônia
@tag inorgânico

@p piramidal 1,2,3
N 1 2 3
H 1
H 2
H 3', 'HHHN', '[]'),('c622f3b4-e276-4403-ae72-3d9602810306', 'carbonato de cálcio', '@name carbonato de cálcio
@tag inorgânico

@p trigonal_plana 1,2,3
C 1 2 3 4
O 1
1 =
O -1 2
O -1 3

4 i; 210°
Ca +2 4', 'CCaOOO', '[]'),('38c6673d-998d-4489-a157-6623a8c064fd', 'cinamaldeído', '@name cinamaldeído
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

@p aldeido 17,18,19', 'CCCCCCCCCHHHHHHHHO', '[]'),('fe93e2e9-b3b5-46d5-ad20-13b9e06f61ef', 'fenol', '@name fenol

@p benzeno 1,2,3,4,5,6,7,8,9,10,11,12
H 7
H 9
H 10
H 11
H 12
@p hidroxila 8,13
13 0°', 'CCCCCCHHHHHHO', '[]'),('9178a1eb-a1a0-41ff-881c-a3f53c537d1b', 'água', '@name água
@tag inorgânico

@p angular 1,2
O 1 2
H 1
H 2', 'HHO', '[]'),('05268c52-7112-45a3-905a-a9b70c4aa2a3', 'bis-2-(cloroétil)tioéter', '@name bis-2-(cloroétil)tioéter
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