��
��
�
ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
�
AsString

input"T

output"
Ttype:
	2	
"
	precisionint���������"

scientificbool( "
shortestbool( "
widthint���������"
fillstring 
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
8
Const
output"dtype"
valuetensor"
dtypetype
B
Equal
x"T
y"T
z
"
Ttype:
2	
�
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
V
HistogramSummary
tag
values"T
summary"
Ttype0:
2	
.
Identity

input"T
output"T"	
Ttype
p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
�
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
P
ScalarSummary
tags
values"T
summary"
Ttype:
2	
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �"serve*1.6.02v1.6.0-0-gd2e24b6039��
�
-global_step/Initializer/zeros/shape_as_tensorConst*
valueB *
_class
loc:@global_step*
dtype0*
_output_shapes
: 
�
#global_step/Initializer/zeros/ConstConst*
_output_shapes
: *
value	B	 R *
_class
loc:@global_step*
dtype0	
�
global_step/Initializer/zerosFill-global_step/Initializer/zeros/shape_as_tensor#global_step/Initializer/zeros/Const*
T0	*

index_type0*
_class
loc:@global_step*
_output_shapes
: 
�
global_step
VariableV2*
dtype0	*
_output_shapes
: *
shared_name *
_class
loc:@global_step*
	container *
shape: 
�
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
_output_shapes
: *
T0	*
_class
loc:@global_step
o
input_example_tensorPlaceholder*
dtype0*#
_output_shapes
:���������*
shape:���������
U
ParseExample/ConstConst*
valueB *
dtype0*
_output_shapes
: 
b
ParseExample/ParseExample/namesConst*
valueB *
dtype0*
_output_shapes
: 
t
&ParseExample/ParseExample/dense_keys_0Const*
valueB Bkpop_features*
dtype0*
_output_shapes
: 
�
ParseExample/ParseExampleParseExampleinput_example_tensorParseExample/ParseExample/names&ParseExample/ParseExample/dense_keys_0ParseExample/Const*'
_output_shapes
:���������*
Nsparse *
sparse_types
 *
dense_shapes
:*
Tdense
2*
Ndense
�
'linear/linear_model/kpop_features/ShapeShapeParseExample/ParseExample*
out_type0*
_output_shapes
:*
T0

5linear/linear_model/kpop_features/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
�
7linear/linear_model/kpop_features/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
�
7linear/linear_model/kpop_features/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
/linear/linear_model/kpop_features/strided_sliceStridedSlice'linear/linear_model/kpop_features/Shape5linear/linear_model/kpop_features/strided_slice/stack7linear/linear_model/kpop_features/strided_slice/stack_17linear/linear_model/kpop_features/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
s
1linear/linear_model/kpop_features/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
�
/linear/linear_model/kpop_features/Reshape/shapePack/linear/linear_model/kpop_features/strided_slice1linear/linear_model/kpop_features/Reshape/shape/1*
T0*

axis *
N*
_output_shapes
:
�
)linear/linear_model/kpop_features/ReshapeReshapeParseExample/ParseExample/linear/linear_model/kpop_features/Reshape/shape*
Tshape0*'
_output_shapes
:���������*
T0
�
Rlinear/linear_model/kpop_features/weights/part_0/Initializer/zeros/shape_as_tensorConst*
valueB"      *C
_class9
75loc:@linear/linear_model/kpop_features/weights/part_0*
dtype0*
_output_shapes
:
�
Hlinear/linear_model/kpop_features/weights/part_0/Initializer/zeros/ConstConst*
valueB
 *    *C
_class9
75loc:@linear/linear_model/kpop_features/weights/part_0*
dtype0*
_output_shapes
: 
�
Blinear/linear_model/kpop_features/weights/part_0/Initializer/zerosFillRlinear/linear_model/kpop_features/weights/part_0/Initializer/zeros/shape_as_tensorHlinear/linear_model/kpop_features/weights/part_0/Initializer/zeros/Const*
_output_shapes

:*
T0*

index_type0*C
_class9
75loc:@linear/linear_model/kpop_features/weights/part_0
�
0linear/linear_model/kpop_features/weights/part_0
VariableV2*C
_class9
75loc:@linear/linear_model/kpop_features/weights/part_0*
	container *
shape
:*
dtype0*
_output_shapes

:*
shared_name 
�
7linear/linear_model/kpop_features/weights/part_0/AssignAssign0linear/linear_model/kpop_features/weights/part_0Blinear/linear_model/kpop_features/weights/part_0/Initializer/zeros*
use_locking(*
T0*C
_class9
75loc:@linear/linear_model/kpop_features/weights/part_0*
validate_shape(*
_output_shapes

:
�
5linear/linear_model/kpop_features/weights/part_0/readIdentity0linear/linear_model/kpop_features/weights/part_0*
T0*C
_class9
75loc:@linear/linear_model/kpop_features/weights/part_0*
_output_shapes

:
�
)linear/linear_model/kpop_features/weightsIdentity5linear/linear_model/kpop_features/weights/part_0/read*
_output_shapes

:*
T0
�
.linear/linear_model/kpop_features/weighted_sumMatMul)linear/linear_model/kpop_features/Reshape)linear/linear_model/kpop_features/weights*'
_output_shapes
:���������*
transpose_a( *
transpose_b( *
T0
�
(linear/linear_model/weighted_sum_no_biasIdentity.linear/linear_model/kpop_features/weighted_sum*
T0*'
_output_shapes
:���������
�
Ilinear/linear_model/bias_weights/part_0/Initializer/zeros/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0
�
?linear/linear_model/bias_weights/part_0/Initializer/zeros/ConstConst*
valueB
 *    *:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
dtype0*
_output_shapes
: 
�
9linear/linear_model/bias_weights/part_0/Initializer/zerosFillIlinear/linear_model/bias_weights/part_0/Initializer/zeros/shape_as_tensor?linear/linear_model/bias_weights/part_0/Initializer/zeros/Const*

index_type0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
:*
T0
�
'linear/linear_model/bias_weights/part_0
VariableV2*
dtype0*
_output_shapes
:*
shared_name *:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
	container *
shape:
�
.linear/linear_model/bias_weights/part_0/AssignAssign'linear/linear_model/bias_weights/part_09linear/linear_model/bias_weights/part_0/Initializer/zeros*
use_locking(*
T0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
validate_shape(*
_output_shapes
:
�
,linear/linear_model/bias_weights/part_0/readIdentity'linear/linear_model/bias_weights/part_0*
T0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
:

 linear/linear_model/bias_weightsIdentity,linear/linear_model/bias_weights/part_0/read*
T0*
_output_shapes
:
�
 linear/linear_model/weighted_sumBiasAdd(linear/linear_model/weighted_sum_no_bias linear/linear_model/bias_weights*
data_formatNHWC*'
_output_shapes
:���������*
T0
[
linear/bias/tagConst*
valueB Blinear/bias*
dtype0*
_output_shapes
: 
�
linear/bias/valuesPack,linear/linear_model/bias_weights/part_0/read*
T0*

axis *
N*
_output_shapes

:
e
linear/biasHistogramSummarylinear/bias/taglinear/bias/values*
T0*
_output_shapes
: 
g
linear/Reshape/shapeConst*
_output_shapes
:*
valueB:
���������*
dtype0
�
linear/ReshapeReshape5linear/linear_model/kpop_features/weights/part_0/readlinear/Reshape/shape*
T0*
Tshape0*
_output_shapes
:
Z
linear/concat/concat_dimConst*
value	B : *
dtype0*
_output_shapes
: 
N
linear/concatIdentitylinear/Reshape*
T0*
_output_shapes
:
^
linear/zero_fraction/zeroConst*
dtype0*
_output_shapes
: *
valueB
 *    
r
linear/zero_fraction/EqualEquallinear/concatlinear/zero_fraction/zero*
T0*
_output_shapes
:
q
linear/zero_fraction/CastCastlinear/zero_fraction/Equal*

SrcT0
*
_output_shapes
:*

DstT0
d
linear/zero_fraction/ConstConst*
_output_shapes
:*
valueB: *
dtype0
�
linear/zero_fraction/MeanMeanlinear/zero_fraction/Castlinear/zero_fraction/Const*
_output_shapes
: *
	keep_dims( *

Tidx0*
T0
�
$linear/fraction_of_zero_weights/tagsConst*0
value'B% Blinear/fraction_of_zero_weights*
dtype0*
_output_shapes
: 
�
linear/fraction_of_zero_weightsScalarSummary$linear/fraction_of_zero_weights/tagslinear/zero_fraction/Mean*
T0*
_output_shapes
: 
x
linear/head/logits/ShapeShape linear/linear_model/weighted_sum*
T0*
out_type0*
_output_shapes
:
n
,linear/head/logits/assert_rank_at_least/rankConst*
_output_shapes
: *
value	B :*
dtype0
^
Vlinear/head/logits/assert_rank_at_least/assert_type/statically_determined_correct_typeNoOp
O
Glinear/head/logits/assert_rank_at_least/static_checks_determined_all_okNoOp
v
+linear/head/predictions/class_ids/dimensionConst*
valueB :
���������*
dtype0*
_output_shapes
: 
�
!linear/head/predictions/class_idsArgMax linear/linear_model/weighted_sum+linear/head/predictions/class_ids/dimension*
T0*
output_type0	*#
_output_shapes
:���������*

Tidx0
q
&linear/head/predictions/ExpandDims/dimConst*
valueB :
���������*
dtype0*
_output_shapes
: 
�
"linear/head/predictions/ExpandDims
ExpandDims!linear/head/predictions/class_ids&linear/head/predictions/ExpandDims/dim*'
_output_shapes
:���������*

Tdim0*
T0	
�
#linear/head/predictions/str_classesAsString"linear/head/predictions/ExpandDims*'
_output_shapes
:���������*
	precision���������*
shortest( *
T0	*

fill *

scientific( *
width���������
�
%linear/head/predictions/probabilitiesSoftmax linear/linear_model/weighted_sum*
T0*'
_output_shapes
:���������
v
linear/head/ShapeShape%linear/head/predictions/probabilities*
T0*
out_type0*
_output_shapes
:
i
linear/head/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
k
!linear/head/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
k
!linear/head/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
�
linear/head/strided_sliceStridedSlicelinear/head/Shapelinear/head/strided_slice/stack!linear/head/strided_slice/stack_1!linear/head/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
Y
linear/head/range/startConst*
_output_shapes
: *
value	B : *
dtype0
Y
linear/head/range/limitConst*
value	B :*
dtype0*
_output_shapes
: 
Y
linear/head/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
�
linear/head/rangeRangelinear/head/range/startlinear/head/range/limitlinear/head/range/delta*
_output_shapes
:*

Tidx0
�
linear/head/AsStringAsStringlinear/head/range*
width���������*
_output_shapes
:*
shortest( *
	precision���������*
T0*

fill *

scientific( 
\
linear/head/ExpandDims/dimConst*
value	B : *
dtype0*
_output_shapes
: 
�
linear/head/ExpandDims
ExpandDimslinear/head/AsStringlinear/head/ExpandDims/dim*
T0*
_output_shapes

:*

Tdim0
^
linear/head/Tile/multiples/1Const*
dtype0*
_output_shapes
: *
value	B :
�
linear/head/Tile/multiplesPacklinear/head/strided_slicelinear/head/Tile/multiples/1*
T0*

axis *
N*
_output_shapes
:
�
linear/head/TileTilelinear/head/ExpandDimslinear/head/Tile/multiples*'
_output_shapes
:���������*

Tmultiples0*
T0
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
�
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_df127b94494f46e39956f8ef05e17773/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
�
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
�
save/SaveV2/tensor_namesConst"/device:CPU:0*m
valuedBbBglobal_stepB linear/linear_model/bias_weightsB)linear/linear_model/kpop_features/weights*
dtype0*
_output_shapes
:
�
save/SaveV2/shape_and_slicesConst"/device:CPU:0*)
value BB B3 0,3B6 3 0,6:0,3*
dtype0*
_output_shapes
:
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesglobal_step,linear/linear_model/bias_weights/part_0/read5linear/linear_model/kpop_features/weights/part_0/read"/device:CPU:0*
dtypes
2	
�
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
_output_shapes
: *
T0*'
_class
loc:@save/ShardedFilename
�
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
_output_shapes
:*
T0*

axis *
N
�
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
�
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 
�
save/RestoreV2/tensor_namesConst"/device:CPU:0*m
valuedBbBglobal_stepB linear/linear_model/bias_weightsB)linear/linear_model/kpop_features/weights*
dtype0*
_output_shapes
:
�
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*)
value BB B3 0,3B6 3 0,6:0,3
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*(
_output_shapes
:::*
dtypes
2	
�
save/AssignAssignglobal_stepsave/RestoreV2*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
�
save/Assign_1Assign'linear/linear_model/bias_weights/part_0save/RestoreV2:1*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
�
save/Assign_2Assign0linear/linear_model/kpop_features/weights/part_0save/RestoreV2:2*
use_locking(*
T0*C
_class9
75loc:@linear/linear_model/kpop_features/weights/part_0*
validate_shape(*
_output_shapes

:
H
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2
-
save/restore_allNoOp^save/restore_shard

initNoOp

init_all_tablesNoOp

init_1NoOp
4

group_depsNoOp^init^init_all_tables^init_1
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
�
save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_79382b1b45a045fb9eb5c018c9e4e715/part*
dtype0*
_output_shapes
: 
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
	separator *
N*
_output_shapes
: 
S
save_1/num_shardsConst*
_output_shapes
: *
value	B :*
dtype0
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
�
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
�
save_1/SaveV2/tensor_namesConst"/device:CPU:0*m
valuedBbBglobal_stepB linear/linear_model/bias_weightsB)linear/linear_model/kpop_features/weights*
dtype0*
_output_shapes
:
�
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*)
value BB B3 0,3B6 3 0,6:0,3*
dtype0*
_output_shapes
:
�
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesglobal_step,linear/linear_model/bias_weights/part_0/read5linear/linear_model/kpop_features/weights/part_0/read"/device:CPU:0*
dtypes
2	
�
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
_output_shapes
: *
T0*)
_class
loc:@save_1/ShardedFilename
�
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
_output_shapes
:*
T0*

axis *
N
�
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0*
delete_old_dirs(
�
save_1/IdentityIdentitysave_1/Const^save_1/control_dependency^save_1/MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 
�
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*m
valuedBbBglobal_stepB linear/linear_model/bias_weightsB)linear/linear_model/kpop_features/weights*
dtype0*
_output_shapes
:
�
!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*)
value BB B3 0,3B6 3 0,6:0,3*
dtype0*
_output_shapes
:
�
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*(
_output_shapes
:::*
dtypes
2	
�
save_1/AssignAssignglobal_stepsave_1/RestoreV2*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
�
save_1/Assign_1Assign'linear/linear_model/bias_weights/part_0save_1/RestoreV2:1*
use_locking(*
T0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
validate_shape(*
_output_shapes
:
�
save_1/Assign_2Assign0linear/linear_model/kpop_features/weights/part_0save_1/RestoreV2:2*
use_locking(*
T0*C
_class9
75loc:@linear/linear_model/kpop_features/weights/part_0*
validate_shape(*
_output_shapes

:
P
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"�
model_variables��
�
2linear/linear_model/kpop_features/weights/part_0:07linear/linear_model/kpop_features/weights/part_0/Assign7linear/linear_model/kpop_features/weights/part_0/read:0"7
)linear/linear_model/kpop_features/weights  "2Dlinear/linear_model/kpop_features/weights/part_0/Initializer/zeros:0
�
)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign.linear/linear_model/bias_weights/part_0/read:0"+
 linear/linear_model/bias_weights "2;linear/linear_model/bias_weights/part_0/Initializer/zeros:0"�
trainable_variables��
�
2linear/linear_model/kpop_features/weights/part_0:07linear/linear_model/kpop_features/weights/part_0/Assign7linear/linear_model/kpop_features/weights/part_0/read:0"7
)linear/linear_model/kpop_features/weights  "2Dlinear/linear_model/kpop_features/weights/part_0/Initializer/zeros:0
�
)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign.linear/linear_model/bias_weights/part_0/read:0"+
 linear/linear_model/bias_weights "2;linear/linear_model/bias_weights/part_0/Initializer/zeros:0"A
	summaries4
2
linear/bias:0
!linear/fraction_of_zero_weights:0"�
	variables��
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0
�
2linear/linear_model/kpop_features/weights/part_0:07linear/linear_model/kpop_features/weights/part_0/Assign7linear/linear_model/kpop_features/weights/part_0/read:0"7
)linear/linear_model/kpop_features/weights  "2Dlinear/linear_model/kpop_features/weights/part_0/Initializer/zeros:0
�
)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign.linear/linear_model/bias_weights/part_0/read:0"+
 linear/linear_model/bias_weights "2;linear/linear_model/bias_weights/part_0/Initializer/zeros:0" 
legacy_init_op


group_deps" 
global_step

global_step:0*�
predict�
5
examples)
input_example_tensor:0���������O
probabilities>
'linear/head/predictions/probabilities:0���������H
	class_ids;
$linear/head/predictions/ExpandDims:0	���������C
logits9
"linear/linear_model/weighted_sum:0���������G
classes<
%linear/head/predictions/str_classes:0���������tensorflow/serving/predict*�
classification�
3
inputs)
input_example_tensor:0���������H
scores>
'linear/head/predictions/probabilities:0���������4
classes)
linear/head/Tile:0���������tensorflow/serving/classify*�
serving_default�
3
inputs)
input_example_tensor:0���������4
classes)
linear/head/Tile:0���������H
scores>
'linear/head/predictions/probabilities:0���������tensorflow/serving/classify