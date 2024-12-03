{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import AST
import Control.Monad.State
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,344) ([0,0,0,1,0,0,32,0,0,2048,0,0,0,0,4096,0,0,0,4,0,0,256,0,0,0,0,0,1024,51213,3197,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,2568,64400,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3968,894,0,0,0,0,0,0,0,0,2080,1600,96,0,0,0,32768,32,32792,1,0,0,0,0,0,0,0,16,0,0,512,0,0,0,0,256,0,0,8192,0,256,0,0,8192,0,0,0,64,0,0,0,0,0,4160,3200,192,2048,36866,6145,0,65,50,3,32768,0,0,0,16,0,32768,32,32793,1,1040,800,48,0,0,0,0,0,0,0,50672,111,0,16640,12800,768,8192,16392,24582,0,260,200,12,8320,6400,384,4096,8196,12291,0,130,100,6,4160,3200,192,2048,36866,6145,0,65,50,3,2080,1600,96,1024,51201,3072,32768,32,32793,1,1040,800,48,0,0,0,0,0,0,0,496,0,0,15872,0,0,49152,7,0,0,248,0,0,7936,0,0,57344,3,0,0,124,0,0,3968,0,0,0,0,0,0,0,0,0,0,0,0,57344,0,0,0,28,0,0,0,0,0,31744,7153,0,32768,32303,3,0,520,400,25,16640,12800,800,0,16,0,0,57592,55,0,16384,0,0,57344,57219,0,0,0,0,0,0,0,0,61440,28609,0,0,64,0,0,1984,447,0,0,1,0,32768,160,36793,1,5136,63264,49,0,0,0,0,0,0,0,1024,0,0,32768,0,0,0,0,0,0,0,0,0,41088,47360,399,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Start","Block","Blstm","ExpStmt","PrintStmt","Stm","PrintArg","VarValDecl","Assi","Iff","Wh","ReadLn","Str","Exp","Term","num","\"+\"","\"-\"","\"*\"","\"/\"","\"%\"","\"(\"","\")\"","\"{\"","\"}\"","\"=\"","\"==\"","\"!=\"","\"<\"","\"<=\"","\">\"","\">=\"","\"!\"","\"||\"","\"&&\"","\"true\"","\"false\"","\"if\"","\"else\"","\"while\"","\"var\"","\"val\"","\"println\"","\"print\"","\"readln\"","\"fun\"","\"main\"","id","str","%eof"]
        bit_start = st Prelude.* 53
        bit_end = (st Prelude.+ 1) Prelude.* 53
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..52]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (49) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (49) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (50) = happyShift action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (53) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (25) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (26) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (27) = happyShift action_8
action_6 (5) = happyGoto action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_1

action_8 (19) = happyShift action_22
action_8 (25) = happyShift action_23
action_8 (27) = happyShift action_8
action_8 (28) = happyShift action_24
action_8 (36) = happyShift action_25
action_8 (39) = happyShift action_26
action_8 (40) = happyShift action_27
action_8 (41) = happyShift action_28
action_8 (43) = happyShift action_29
action_8 (44) = happyShift action_30
action_8 (45) = happyShift action_31
action_8 (46) = happyShift action_32
action_8 (47) = happyShift action_33
action_8 (51) = happyShift action_34
action_8 (52) = happyShift action_35
action_8 (5) = happyGoto action_9
action_8 (6) = happyGoto action_10
action_8 (7) = happyGoto action_11
action_8 (8) = happyGoto action_12
action_8 (9) = happyGoto action_13
action_8 (11) = happyGoto action_14
action_8 (12) = happyGoto action_15
action_8 (13) = happyGoto action_16
action_8 (14) = happyGoto action_17
action_8 (15) = happyGoto action_18
action_8 (16) = happyGoto action_19
action_8 (17) = happyGoto action_20
action_8 (18) = happyGoto action_21
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_9

action_10 (28) = happyShift action_60
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_10

action_12 _ = happyReduce_15

action_13 (19) = happyShift action_22
action_13 (25) = happyShift action_23
action_13 (27) = happyShift action_8
action_13 (36) = happyShift action_25
action_13 (39) = happyShift action_26
action_13 (40) = happyShift action_27
action_13 (41) = happyShift action_28
action_13 (43) = happyShift action_29
action_13 (44) = happyShift action_30
action_13 (45) = happyShift action_31
action_13 (46) = happyShift action_32
action_13 (47) = happyShift action_33
action_13 (51) = happyShift action_34
action_13 (52) = happyShift action_35
action_13 (5) = happyGoto action_9
action_13 (6) = happyGoto action_59
action_13 (7) = happyGoto action_11
action_13 (8) = happyGoto action_12
action_13 (9) = happyGoto action_13
action_13 (11) = happyGoto action_14
action_13 (12) = happyGoto action_15
action_13 (13) = happyGoto action_16
action_13 (14) = happyGoto action_17
action_13 (15) = happyGoto action_18
action_13 (16) = happyGoto action_19
action_13 (17) = happyGoto action_20
action_13 (18) = happyGoto action_21
action_13 _ = happyReduce_5

action_14 _ = happyReduce_11

action_15 _ = happyReduce_12

action_16 _ = happyReduce_13

action_17 _ = happyReduce_14

action_18 _ = happyReduce_16

action_19 _ = happyReduce_43

action_20 (20) = happyShift action_46
action_20 (21) = happyShift action_47
action_20 (22) = happyShift action_48
action_20 (23) = happyShift action_49
action_20 (24) = happyShift action_50
action_20 (30) = happyShift action_51
action_20 (31) = happyShift action_52
action_20 (32) = happyShift action_53
action_20 (33) = happyShift action_54
action_20 (34) = happyShift action_55
action_20 (35) = happyShift action_56
action_20 (37) = happyShift action_57
action_20 (38) = happyShift action_58
action_20 _ = happyReduce_6

action_21 _ = happyReduce_27

action_22 _ = happyReduce_42

action_23 (19) = happyShift action_22
action_23 (25) = happyShift action_23
action_23 (36) = happyShift action_25
action_23 (39) = happyShift action_26
action_23 (40) = happyShift action_27
action_23 (51) = happyShift action_44
action_23 (52) = happyShift action_35
action_23 (16) = happyGoto action_19
action_23 (17) = happyGoto action_45
action_23 (18) = happyGoto action_21
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_3

action_25 (19) = happyShift action_22
action_25 (25) = happyShift action_23
action_25 (39) = happyShift action_26
action_25 (40) = happyShift action_27
action_25 (51) = happyShift action_44
action_25 (52) = happyShift action_35
action_25 (16) = happyGoto action_19
action_25 (18) = happyGoto action_43
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_45

action_27 _ = happyReduce_46

action_28 (25) = happyShift action_42
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (25) = happyShift action_41
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (51) = happyShift action_40
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (51) = happyShift action_39
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (25) = happyShift action_38
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (25) = happyShift action_37
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (29) = happyShift action_36
action_34 _ = happyReduce_44

action_35 _ = happyReduce_26

action_36 (19) = happyShift action_22
action_36 (25) = happyShift action_23
action_36 (36) = happyShift action_25
action_36 (39) = happyShift action_26
action_36 (40) = happyShift action_27
action_36 (51) = happyShift action_44
action_36 (52) = happyShift action_35
action_36 (16) = happyGoto action_19
action_36 (17) = happyGoto action_82
action_36 (18) = happyGoto action_21
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (19) = happyShift action_22
action_37 (25) = happyShift action_23
action_37 (36) = happyShift action_25
action_37 (39) = happyShift action_26
action_37 (40) = happyShift action_27
action_37 (51) = happyShift action_44
action_37 (52) = happyShift action_35
action_37 (10) = happyGoto action_81
action_37 (16) = happyGoto action_19
action_37 (17) = happyGoto action_80
action_37 (18) = happyGoto action_21
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (19) = happyShift action_22
action_38 (25) = happyShift action_23
action_38 (36) = happyShift action_25
action_38 (39) = happyShift action_26
action_38 (40) = happyShift action_27
action_38 (51) = happyShift action_44
action_38 (52) = happyShift action_35
action_38 (10) = happyGoto action_79
action_38 (16) = happyGoto action_19
action_38 (17) = happyGoto action_80
action_38 (18) = happyGoto action_21
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (29) = happyShift action_78
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (29) = happyShift action_77
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (19) = happyShift action_22
action_41 (25) = happyShift action_23
action_41 (36) = happyShift action_25
action_41 (39) = happyShift action_26
action_41 (40) = happyShift action_27
action_41 (51) = happyShift action_44
action_41 (52) = happyShift action_35
action_41 (16) = happyGoto action_19
action_41 (17) = happyGoto action_76
action_41 (18) = happyGoto action_21
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (19) = happyShift action_22
action_42 (25) = happyShift action_23
action_42 (36) = happyShift action_25
action_42 (39) = happyShift action_26
action_42 (40) = happyShift action_27
action_42 (51) = happyShift action_44
action_42 (52) = happyShift action_35
action_42 (16) = happyGoto action_19
action_42 (17) = happyGoto action_75
action_42 (18) = happyGoto action_21
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_41

action_44 _ = happyReduce_44

action_45 (20) = happyShift action_46
action_45 (21) = happyShift action_47
action_45 (22) = happyShift action_48
action_45 (23) = happyShift action_49
action_45 (24) = happyShift action_50
action_45 (26) = happyShift action_74
action_45 (30) = happyShift action_51
action_45 (31) = happyShift action_52
action_45 (32) = happyShift action_53
action_45 (33) = happyShift action_54
action_45 (34) = happyShift action_55
action_45 (35) = happyShift action_56
action_45 (37) = happyShift action_57
action_45 (38) = happyShift action_58
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (19) = happyShift action_22
action_46 (25) = happyShift action_23
action_46 (36) = happyShift action_25
action_46 (39) = happyShift action_26
action_46 (40) = happyShift action_27
action_46 (51) = happyShift action_44
action_46 (52) = happyShift action_35
action_46 (16) = happyGoto action_19
action_46 (17) = happyGoto action_73
action_46 (18) = happyGoto action_21
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (19) = happyShift action_22
action_47 (25) = happyShift action_23
action_47 (36) = happyShift action_25
action_47 (39) = happyShift action_26
action_47 (40) = happyShift action_27
action_47 (51) = happyShift action_44
action_47 (52) = happyShift action_35
action_47 (16) = happyGoto action_19
action_47 (17) = happyGoto action_72
action_47 (18) = happyGoto action_21
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (19) = happyShift action_22
action_48 (25) = happyShift action_23
action_48 (36) = happyShift action_25
action_48 (39) = happyShift action_26
action_48 (40) = happyShift action_27
action_48 (51) = happyShift action_44
action_48 (52) = happyShift action_35
action_48 (16) = happyGoto action_19
action_48 (17) = happyGoto action_71
action_48 (18) = happyGoto action_21
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (19) = happyShift action_22
action_49 (25) = happyShift action_23
action_49 (36) = happyShift action_25
action_49 (39) = happyShift action_26
action_49 (40) = happyShift action_27
action_49 (51) = happyShift action_44
action_49 (52) = happyShift action_35
action_49 (16) = happyGoto action_19
action_49 (17) = happyGoto action_70
action_49 (18) = happyGoto action_21
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (19) = happyShift action_22
action_50 (25) = happyShift action_23
action_50 (36) = happyShift action_25
action_50 (39) = happyShift action_26
action_50 (40) = happyShift action_27
action_50 (51) = happyShift action_44
action_50 (52) = happyShift action_35
action_50 (16) = happyGoto action_19
action_50 (17) = happyGoto action_69
action_50 (18) = happyGoto action_21
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (19) = happyShift action_22
action_51 (25) = happyShift action_23
action_51 (36) = happyShift action_25
action_51 (39) = happyShift action_26
action_51 (40) = happyShift action_27
action_51 (51) = happyShift action_44
action_51 (52) = happyShift action_35
action_51 (16) = happyGoto action_19
action_51 (17) = happyGoto action_68
action_51 (18) = happyGoto action_21
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (19) = happyShift action_22
action_52 (25) = happyShift action_23
action_52 (36) = happyShift action_25
action_52 (39) = happyShift action_26
action_52 (40) = happyShift action_27
action_52 (51) = happyShift action_44
action_52 (52) = happyShift action_35
action_52 (16) = happyGoto action_19
action_52 (17) = happyGoto action_67
action_52 (18) = happyGoto action_21
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (19) = happyShift action_22
action_53 (25) = happyShift action_23
action_53 (36) = happyShift action_25
action_53 (39) = happyShift action_26
action_53 (40) = happyShift action_27
action_53 (51) = happyShift action_44
action_53 (52) = happyShift action_35
action_53 (16) = happyGoto action_19
action_53 (17) = happyGoto action_66
action_53 (18) = happyGoto action_21
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (19) = happyShift action_22
action_54 (25) = happyShift action_23
action_54 (36) = happyShift action_25
action_54 (39) = happyShift action_26
action_54 (40) = happyShift action_27
action_54 (51) = happyShift action_44
action_54 (52) = happyShift action_35
action_54 (16) = happyGoto action_19
action_54 (17) = happyGoto action_65
action_54 (18) = happyGoto action_21
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (19) = happyShift action_22
action_55 (25) = happyShift action_23
action_55 (36) = happyShift action_25
action_55 (39) = happyShift action_26
action_55 (40) = happyShift action_27
action_55 (51) = happyShift action_44
action_55 (52) = happyShift action_35
action_55 (16) = happyGoto action_19
action_55 (17) = happyGoto action_64
action_55 (18) = happyGoto action_21
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (19) = happyShift action_22
action_56 (25) = happyShift action_23
action_56 (36) = happyShift action_25
action_56 (39) = happyShift action_26
action_56 (40) = happyShift action_27
action_56 (51) = happyShift action_44
action_56 (52) = happyShift action_35
action_56 (16) = happyGoto action_19
action_56 (17) = happyGoto action_63
action_56 (18) = happyGoto action_21
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (19) = happyShift action_22
action_57 (25) = happyShift action_23
action_57 (36) = happyShift action_25
action_57 (39) = happyShift action_26
action_57 (40) = happyShift action_27
action_57 (51) = happyShift action_44
action_57 (52) = happyShift action_35
action_57 (16) = happyGoto action_19
action_57 (17) = happyGoto action_62
action_57 (18) = happyGoto action_21
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (19) = happyShift action_22
action_58 (25) = happyShift action_23
action_58 (36) = happyShift action_25
action_58 (39) = happyShift action_26
action_58 (40) = happyShift action_27
action_58 (51) = happyShift action_44
action_58 (52) = happyShift action_35
action_58 (16) = happyGoto action_19
action_58 (17) = happyGoto action_61
action_58 (18) = happyGoto action_21
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_4

action_60 _ = happyReduce_2

action_61 (20) = happyShift action_46
action_61 (21) = happyShift action_47
action_61 (22) = happyShift action_48
action_61 (23) = happyShift action_49
action_61 (24) = happyShift action_50
action_61 (30) = happyFail []
action_61 (31) = happyFail []
action_61 (32) = happyFail []
action_61 (33) = happyFail []
action_61 (34) = happyFail []
action_61 (35) = happyFail []
action_61 (37) = happyFail []
action_61 (38) = happyFail []
action_61 _ = happyReduce_40

action_62 (20) = happyShift action_46
action_62 (21) = happyShift action_47
action_62 (22) = happyShift action_48
action_62 (23) = happyShift action_49
action_62 (24) = happyShift action_50
action_62 (30) = happyFail []
action_62 (31) = happyFail []
action_62 (32) = happyFail []
action_62 (33) = happyFail []
action_62 (34) = happyFail []
action_62 (35) = happyFail []
action_62 (37) = happyFail []
action_62 (38) = happyFail []
action_62 _ = happyReduce_39

action_63 (20) = happyShift action_46
action_63 (21) = happyShift action_47
action_63 (22) = happyShift action_48
action_63 (23) = happyShift action_49
action_63 (24) = happyShift action_50
action_63 (30) = happyFail []
action_63 (31) = happyFail []
action_63 (32) = happyFail []
action_63 (33) = happyFail []
action_63 (34) = happyFail []
action_63 (35) = happyFail []
action_63 (37) = happyFail []
action_63 (38) = happyFail []
action_63 _ = happyReduce_38

action_64 (20) = happyShift action_46
action_64 (21) = happyShift action_47
action_64 (22) = happyShift action_48
action_64 (23) = happyShift action_49
action_64 (24) = happyShift action_50
action_64 (30) = happyFail []
action_64 (31) = happyFail []
action_64 (32) = happyFail []
action_64 (33) = happyFail []
action_64 (34) = happyFail []
action_64 (35) = happyFail []
action_64 (37) = happyFail []
action_64 (38) = happyFail []
action_64 _ = happyReduce_37

action_65 (20) = happyShift action_46
action_65 (21) = happyShift action_47
action_65 (22) = happyShift action_48
action_65 (23) = happyShift action_49
action_65 (24) = happyShift action_50
action_65 (30) = happyFail []
action_65 (31) = happyFail []
action_65 (32) = happyFail []
action_65 (33) = happyFail []
action_65 (34) = happyFail []
action_65 (35) = happyFail []
action_65 (37) = happyFail []
action_65 (38) = happyFail []
action_65 _ = happyReduce_36

action_66 (20) = happyShift action_46
action_66 (21) = happyShift action_47
action_66 (22) = happyShift action_48
action_66 (23) = happyShift action_49
action_66 (24) = happyShift action_50
action_66 (30) = happyFail []
action_66 (31) = happyFail []
action_66 (32) = happyFail []
action_66 (33) = happyFail []
action_66 (34) = happyFail []
action_66 (35) = happyFail []
action_66 (37) = happyFail []
action_66 (38) = happyFail []
action_66 _ = happyReduce_35

action_67 (20) = happyShift action_46
action_67 (21) = happyShift action_47
action_67 (22) = happyShift action_48
action_67 (23) = happyShift action_49
action_67 (24) = happyShift action_50
action_67 (30) = happyFail []
action_67 (31) = happyFail []
action_67 (32) = happyFail []
action_67 (33) = happyFail []
action_67 (34) = happyFail []
action_67 (35) = happyFail []
action_67 (37) = happyFail []
action_67 (38) = happyFail []
action_67 _ = happyReduce_34

action_68 (20) = happyShift action_46
action_68 (21) = happyShift action_47
action_68 (22) = happyShift action_48
action_68 (23) = happyShift action_49
action_68 (24) = happyShift action_50
action_68 (30) = happyFail []
action_68 (31) = happyFail []
action_68 (32) = happyFail []
action_68 (33) = happyFail []
action_68 (34) = happyFail []
action_68 (35) = happyFail []
action_68 (37) = happyFail []
action_68 (38) = happyFail []
action_68 _ = happyReduce_33

action_69 _ = happyReduce_32

action_70 _ = happyReduce_31

action_71 _ = happyReduce_30

action_72 (22) = happyShift action_48
action_72 (23) = happyShift action_49
action_72 (24) = happyShift action_50
action_72 _ = happyReduce_29

action_73 (22) = happyShift action_48
action_73 (23) = happyShift action_49
action_73 (24) = happyShift action_50
action_73 _ = happyReduce_28

action_74 _ = happyReduce_47

action_75 (20) = happyShift action_46
action_75 (21) = happyShift action_47
action_75 (22) = happyShift action_48
action_75 (23) = happyShift action_49
action_75 (24) = happyShift action_50
action_75 (26) = happyShift action_90
action_75 (30) = happyShift action_51
action_75 (31) = happyShift action_52
action_75 (32) = happyShift action_53
action_75 (33) = happyShift action_54
action_75 (34) = happyShift action_55
action_75 (35) = happyShift action_56
action_75 (37) = happyShift action_57
action_75 (38) = happyShift action_58
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (20) = happyShift action_46
action_76 (21) = happyShift action_47
action_76 (22) = happyShift action_48
action_76 (23) = happyShift action_49
action_76 (24) = happyShift action_50
action_76 (26) = happyShift action_89
action_76 (30) = happyShift action_51
action_76 (31) = happyShift action_52
action_76 (32) = happyShift action_53
action_76 (33) = happyShift action_54
action_76 (34) = happyShift action_55
action_76 (35) = happyShift action_56
action_76 (37) = happyShift action_57
action_76 (38) = happyShift action_58
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (19) = happyShift action_22
action_77 (25) = happyShift action_23
action_77 (36) = happyShift action_25
action_77 (39) = happyShift action_26
action_77 (40) = happyShift action_27
action_77 (48) = happyShift action_88
action_77 (51) = happyShift action_44
action_77 (52) = happyShift action_35
action_77 (16) = happyGoto action_19
action_77 (17) = happyGoto action_87
action_77 (18) = happyGoto action_21
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (19) = happyShift action_22
action_78 (25) = happyShift action_23
action_78 (36) = happyShift action_25
action_78 (39) = happyShift action_26
action_78 (40) = happyShift action_27
action_78 (48) = happyShift action_86
action_78 (51) = happyShift action_44
action_78 (52) = happyShift action_35
action_78 (16) = happyGoto action_19
action_78 (17) = happyGoto action_85
action_78 (18) = happyGoto action_21
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (26) = happyShift action_84
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (20) = happyShift action_46
action_80 (21) = happyShift action_47
action_80 (22) = happyShift action_48
action_80 (23) = happyShift action_49
action_80 (24) = happyShift action_50
action_80 (30) = happyShift action_51
action_80 (31) = happyShift action_52
action_80 (32) = happyShift action_53
action_80 (33) = happyShift action_54
action_80 (34) = happyShift action_55
action_80 (35) = happyShift action_56
action_80 (37) = happyShift action_57
action_80 (38) = happyShift action_58
action_80 _ = happyReduce_17

action_81 (26) = happyShift action_83
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (20) = happyShift action_46
action_82 (21) = happyShift action_47
action_82 (22) = happyShift action_48
action_82 (23) = happyShift action_49
action_82 (24) = happyShift action_50
action_82 (30) = happyShift action_51
action_82 (31) = happyShift action_52
action_82 (32) = happyShift action_53
action_82 (33) = happyShift action_54
action_82 (34) = happyShift action_55
action_82 (35) = happyShift action_56
action_82 (37) = happyShift action_57
action_82 (38) = happyShift action_58
action_82 _ = happyReduce_20

action_83 _ = happyReduce_7

action_84 _ = happyReduce_8

action_85 (20) = happyShift action_46
action_85 (21) = happyShift action_47
action_85 (22) = happyShift action_48
action_85 (23) = happyShift action_49
action_85 (24) = happyShift action_50
action_85 (30) = happyShift action_51
action_85 (31) = happyShift action_52
action_85 (32) = happyShift action_53
action_85 (33) = happyShift action_54
action_85 (34) = happyShift action_55
action_85 (35) = happyShift action_56
action_85 (37) = happyShift action_57
action_85 (38) = happyShift action_58
action_85 _ = happyReduce_19

action_86 (25) = happyShift action_94
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (20) = happyShift action_46
action_87 (21) = happyShift action_47
action_87 (22) = happyShift action_48
action_87 (23) = happyShift action_49
action_87 (24) = happyShift action_50
action_87 (30) = happyShift action_51
action_87 (31) = happyShift action_52
action_87 (32) = happyShift action_53
action_87 (33) = happyShift action_54
action_87 (34) = happyShift action_55
action_87 (35) = happyShift action_56
action_87 (37) = happyShift action_57
action_87 (38) = happyShift action_58
action_87 _ = happyReduce_18

action_88 (25) = happyShift action_93
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (19) = happyShift action_22
action_89 (25) = happyShift action_23
action_89 (27) = happyShift action_8
action_89 (36) = happyShift action_25
action_89 (39) = happyShift action_26
action_89 (40) = happyShift action_27
action_89 (41) = happyShift action_28
action_89 (43) = happyShift action_29
action_89 (44) = happyShift action_30
action_89 (45) = happyShift action_31
action_89 (46) = happyShift action_32
action_89 (47) = happyShift action_33
action_89 (51) = happyShift action_34
action_89 (52) = happyShift action_35
action_89 (5) = happyGoto action_9
action_89 (7) = happyGoto action_11
action_89 (8) = happyGoto action_12
action_89 (9) = happyGoto action_92
action_89 (11) = happyGoto action_14
action_89 (12) = happyGoto action_15
action_89 (13) = happyGoto action_16
action_89 (14) = happyGoto action_17
action_89 (15) = happyGoto action_18
action_89 (16) = happyGoto action_19
action_89 (17) = happyGoto action_20
action_89 (18) = happyGoto action_21
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (19) = happyShift action_22
action_90 (25) = happyShift action_23
action_90 (27) = happyShift action_8
action_90 (36) = happyShift action_25
action_90 (39) = happyShift action_26
action_90 (40) = happyShift action_27
action_90 (41) = happyShift action_28
action_90 (43) = happyShift action_29
action_90 (44) = happyShift action_30
action_90 (45) = happyShift action_31
action_90 (46) = happyShift action_32
action_90 (47) = happyShift action_33
action_90 (51) = happyShift action_34
action_90 (52) = happyShift action_35
action_90 (5) = happyGoto action_9
action_90 (7) = happyGoto action_11
action_90 (8) = happyGoto action_12
action_90 (9) = happyGoto action_91
action_90 (11) = happyGoto action_14
action_90 (12) = happyGoto action_15
action_90 (13) = happyGoto action_16
action_90 (14) = happyGoto action_17
action_90 (15) = happyGoto action_18
action_90 (16) = happyGoto action_19
action_90 (17) = happyGoto action_20
action_90 (18) = happyGoto action_21
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (42) = happyShift action_97
action_91 _ = happyReduce_21

action_92 _ = happyReduce_23

action_93 (26) = happyShift action_96
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (26) = happyShift action_95
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_25

action_96 _ = happyReduce_24

action_97 (19) = happyShift action_22
action_97 (25) = happyShift action_23
action_97 (27) = happyShift action_8
action_97 (36) = happyShift action_25
action_97 (39) = happyShift action_26
action_97 (40) = happyShift action_27
action_97 (41) = happyShift action_28
action_97 (43) = happyShift action_29
action_97 (44) = happyShift action_30
action_97 (45) = happyShift action_31
action_97 (46) = happyShift action_32
action_97 (47) = happyShift action_33
action_97 (51) = happyShift action_34
action_97 (52) = happyShift action_35
action_97 (5) = happyGoto action_9
action_97 (7) = happyGoto action_11
action_97 (8) = happyGoto action_12
action_97 (9) = happyGoto action_98
action_97 (11) = happyGoto action_14
action_97 (12) = happyGoto action_15
action_97 (13) = happyGoto action_16
action_97 (14) = happyGoto action_17
action_97 (15) = happyGoto action_18
action_97 (16) = happyGoto action_19
action_97 (17) = happyGoto action_20
action_97 (18) = happyGoto action_21
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_22

happyReduce_1 = happyReduce 5 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Main happy_var_5
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Block happy_var_2
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 _
	_
	 =  HappyAbsSyn5
		 (Block []
	)

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn7
		 (ExprStmt happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 8 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Print happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 4 8 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Println happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_1  9 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  9 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  9 happyReduction_15
happyReduction_15 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  9 happyReduction_16
happyReduction_16 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn10
		 (PrintExp happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happyReduce 4 11 happyReduction_18
happyReduction_18 ((HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IDENT happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Var happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 4 11 happyReduction_19
happyReduction_19 ((HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IDENT happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Val happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 (HappyAbsSyn17  happy_var_3)
	_
	(HappyTerminal (IDENT happy_var_1))
	 =  HappyAbsSyn12
		 (Assign happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 5 13 happyReduction_21
happyReduction_21 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (If happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 7 13 happyReduction_22
happyReduction_22 ((HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (IfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 5 14 happyReduction_23
happyReduction_23 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 6 15 happyReduction_24
happyReduction_24 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IDENT happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (VarReadLn happy_var_2 ReadLn
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 6 15 happyReduction_25
happyReduction_25 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (IDENT happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (VarReadLn happy_var_2 ReadLn
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_1  16 happyReduction_26
happyReduction_26 (HappyTerminal (STR happy_var_1))
	 =  HappyAbsSyn16
		 (Str happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  17 happyReduction_27
happyReduction_27 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  17 happyReduction_28
happyReduction_28 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Add happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  17 happyReduction_29
happyReduction_29 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Sub happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  17 happyReduction_30
happyReduction_30 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Mul happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  17 happyReduction_31
happyReduction_31 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Div happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  17 happyReduction_32
happyReduction_32 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Mod happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  17 happyReduction_33
happyReduction_33 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Equal happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  17 happyReduction_34
happyReduction_34 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp NotEqual happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  17 happyReduction_35
happyReduction_35 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Less happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  17 happyReduction_36
happyReduction_36 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp LessEq happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  17 happyReduction_37
happyReduction_37 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Greater happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  17 happyReduction_38
happyReduction_38 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp GreaterEq happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  17 happyReduction_39
happyReduction_39 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Or happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  17 happyReduction_40
happyReduction_40 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp And happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_2  17 happyReduction_41
happyReduction_41 (HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (NotOp happy_var_2
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  18 happyReduction_42
happyReduction_42 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn18
		 (Num happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  18 happyReduction_43
happyReduction_43 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  18 happyReduction_44
happyReduction_44 (HappyTerminal (IDENT happy_var_1))
	 =  HappyAbsSyn18
		 (Ident happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  18 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn18
		 (MyTrue
	)

happyReduce_46 = happySpecReduce_1  18 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn18
		 (MyFalse
	)

happyReduce_47 = happySpecReduce_3  18 happyReduction_47
happyReduction_47 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 53 53 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	NUM happy_dollar_dollar -> cont 19;
	PLUS -> cont 20;
	MINUS -> cont 21;
	TIMES -> cont 22;
	DIV -> cont 23;
	MOD -> cont 24;
	LPAREN -> cont 25;
	RPAREN -> cont 26;
	LBRACKET -> cont 27;
	RBRACKET -> cont 28;
	ASSIGN -> cont 29;
	EQUAL -> cont 30;
	NOTEQUAL -> cont 31;
	LESSTHAN -> cont 32;
	LESSEQ -> cont 33;
	GREATERTHAN -> cont 34;
	GREATEREQ -> cont 35;
	NOT -> cont 36;
	OR -> cont 37;
	AND -> cont 38;
	TRUE -> cont 39;
	FALSE -> cont 40;
	IF -> cont 41;
	ELSE -> cont 42;
	WHILE -> cont 43;
	VAR -> cont 44;
	VAL -> cont 45;
	PRINTLN -> cont 46;
	PRINT -> cont 47;
	READLN -> cont 48;
	FUN -> cont 49;
	MAIN -> cont 50;
	IDENT happy_dollar_dollar -> cont 51;
	STR happy_dollar_dollar -> cont 52;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 53 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError toks = error "parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
