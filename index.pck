GDPC                                                                                H   res://.import/goose_idle (1).png-35dc5c94a40ebbe68d5ddee5bcf792e7.stex  �      �      ���{��5I;r[����<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�      �      &�y���ڞu;>��.p   res://Ball.gd.remap  (             �F����"����j   res://Ball.gdc  �      �      �F�I9H���n���w   res://Node2D.gd.remap   @(      !       �����lꏑ�ZV�   res://Node2D.gdc0      I      �uK���M��N���dk   res://Node2D.tscn   �
      E      �;J� J7ӫb��E�FC   res://default_env.tres  �      �       um�`�N��<*ỳ�8   res://game.tscn �      T
      �3!N�ܠ�eB��4m    res://goose_idle (1).png.import �      �      ��v���A�Z��:@�   res://icon.png  p(      �      G1?��z�c��vN��   res://icon.png.import   p%      �      ��fe��6�B��^ U�   res://project.binary`5      L      $#��~»�m\��ά�            GDSC         #   �      ��������τ�   ����Ŷ��   �����Ҷ�   �����϶�   �������Ŷ���   ����׶��   ����¶��   ���������������������Ҷ�   ��������������������Ӷ��   ������������������������ض��   ζ��   �������ض���   ϶��   ���������¶�   �������Ӷ���   ����¶��   ����������������������¶   �������Ӷ���   ������������Ӷ��   ���������Ӷ�   ���������Ӷ�   �������ׄ�������������Ҷ   ���϶���   ����Ӷ��                   click                      Reset timer                                	                           	      
                           #      0      R      V      a      f      j      w      x      y            �      �      �      �      �      �      �       �   !   �   "   �   #   3YYY;�  Y;�  �  YYYY0�  PQV�  -YYYY0�  P�  QV�  &�  T�  P�  Q�  �  V�  �  P�  P�	  PQT�
  �  T�
  R�  P�	  PQT�  �  T�  QQ�  Q�  �  �  &�  	�  V�  �?  PQ�  �  �  �  PQT�  P�  QT�  PQYYY0�  PQV�  �?  P�  Q�  �  PQT�  T�  PQ�  �  PQT�  PQYYY0�  P�  QV�  &�  �  V�  �  PQT�  T�  �  �  �  �  Y`       GDSC            ^      ���ӄ�   ���Ӷ���   ������������Ӷ��   �������Ӷ���   ����Ӷ��   �����϶�   ���������Ӷ�   �������Ŷ���   ����׶��   ���¶���   ��������Ҷ��      res://game.tscn                                                            	      
          &      *      +      ,      -      4      >      ?      E      F      N      W      \      3YYY5;�  �L  PQY5;�  �  T�  PQYY;�  �  YYYY0�  PQV�  �  PQYYYY0�  P�  QV�  W�  T�	  �>  P�  QYY0�  PQV�  �  ;�  �L  PQ�  ;�  �  T�  PQ�  �
  P�  QY`       [gd_scene load_steps=2 format=2]

[ext_resource path="res://Node2D.gd" type="Script" id=1]

[node name="Node2D" type="Node2D"]
script = ExtResource( 1 )

[node name="score" type="RichTextLabel" parent="."]
margin_left = 449.0
margin_top = 1.0
margin_right = 489.0
margin_bottom = 41.0
rect_scale = Vector2( 3, 3 )
text = "5"
           [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             [gd_scene load_steps=10 format=2]

[ext_resource path="res://Ball.gd" type="Script" id=1]
[ext_resource path="res://goose_idle (1).png" type="Texture" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 559.5, 136.5 )

[sub_resource type="PhysicsMaterial" id=4]
bounce = 0.6

[sub_resource type="CircleShape2D" id=2]
radius = 32.3883

[sub_resource type="SphereMesh" id=7]

[sub_resource type="RectangleShape2D" id=5]
extents = Vector2( 10, 39.9 )

[sub_resource type="QuadMesh" id=6]

[sub_resource type="RectangleShape2D" id=8]
extents = Vector2( 48.5, 2.25 )

[node name="game" type="Node2D"]

[node name="Ground" type="StaticBody2D" parent="."]

[node name="CollisionShape2D" type="CollisionShape2D" parent="Ground"]
position = Vector2( 545, 733 )
shape = SubResource( 1 )

[node name="CollisionShape2D2" type="CollisionShape2D" parent="Ground"]
position = Vector2( -135, 409 )
rotation = 1.5805
shape = SubResource( 1 )

[node name="CollisionShape2D3" type="CollisionShape2D" parent="Ground"]
position = Vector2( 1162, 384 )
rotation = 1.5805
shape = SubResource( 1 )

[node name="Ball" type="RigidBody2D" parent="."]
position = Vector2( 142, 338 )
physics_material_override = SubResource( 4 )
gravity_scale = 10.0
script = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="Ball"]
shape = SubResource( 2 )

[node name="MeshInstance2D" type="MeshInstance2D" parent="Ball/CollisionShape2D"]
scale = Vector2( 30, 30 )
mesh = SubResource( 7 )
texture = ExtResource( 2 )

[node name="Net" type="StaticBody2D" parent="."]

[node name="CollisionShape2D" type="CollisionShape2D" parent="Net"]
position = Vector2( 965, 476 )
scale = Vector2( 1, 10 )
shape = SubResource( 5 )

[node name="MeshInstance2D" type="MeshInstance2D" parent="Net/CollisionShape2D"]
position = Vector2( -0.999998, -2 )
scale = Vector2( 20, 76 )
mesh = SubResource( 6 )

[node name="CollisionShape2D2" type="CollisionShape2D" parent="Net"]
position = Vector2( 847, 151 )
scale = Vector2( 1, 0.2 )
shape = SubResource( 5 )

[node name="MeshInstance2D" type="MeshInstance2D" parent="Net/CollisionShape2D2"]
position = Vector2( -0.999998, 1 )
scale = Vector2( 20, 82 )
mesh = SubResource( 6 )

[node name="Area2D" type="Area2D" parent="Net"]

[node name="CollisionShape2D" type="CollisionShape2D" parent="Net/Area2D"]
position = Vector2( 905, 157 )
shape = SubResource( 8 )

[node name="Reset timer" type="Timer" parent="."]
wait_time = 5.0

[connection signal="body_entered" from="Net/Area2D" to="Ball" method="_on_Area2D_body_entered"]
[connection signal="timeout" from="Reset timer" to="Ball" method="_on_Reset_timer_timeout"]
            GDST)  i           �  WEBPRIFF�  WEBPVP8L�  /(Z0��6�y�E��6���a	HRdEDh�Ѷő!��B�C/��ik/%�(A[�t(mNa����Ì��@�m�m��J��_���/�6�>������Pn����|���L�Cn{"�"�%�%��6���w�� �	��	��ቦ�n 3PJ ����R"x��T���� bO�g���/5����Uz"w�8�9�����/D�&��y�\^g�[p���[+N����P�(M���+y��"O��J!�aE�����Ncn���؊�Dr+�<*8	z�tv��$�=�R�����?[�Q�V	8y��.8��g��S���K7�7�w�6������U�;l ���'页����Qk+�{��x��P���(=��c5�Fx�Z�M*Bn���L!�&�SO�h�g���'�7b�d�ܣq�Q��F�� `�8,�A�u��[�7�\�׺ f�^o��c�Bx �|������  ot�kF�)]X���7R{_tJ�8f�=���`����0�w廦�5�o����e��A,�0��2����N*��T>'�
#�_�i(���4����r�C�_�ĳS�����cR��C<;���uZ��:�11)�1!�*�(J�ViRzFYդ��m�D��*5c_��SB�x[�:�g|�bR�FJY��ܿ�B��l�!�D澊iJ�a<$���<��k	�B:��F�0BO�~[�1t!��:�!� T�4�� ����!��8t��i�o�p�CA�t����S4N{(�l�x\��c������|R9����t�N=&>�r:BA�;�����-���Pb�$�C����
*�cM��BFc�0t%��.e�J\���F���Pp!�X�;��y�( �1t|	J�!��uX`Ok�����(�|�y�>�WZ��c�﷼J�Q`6�h��vʁ����b��vHbX�lKD�t��K�"�N%,�΁V'�/�t+��L4+�OXa76*���6
���l$LT#�a���Hn�����4�hVD_Ua����4�X���ecβ�cQa�}M�YJm�a+�kcE�_SZS��r_�n,���Ȃ�^��[㱃�\^���Ta�y�]���A�$��g
��#�)��`'�Gh>�#�	O���'*�͸W^�J�n����&݃��9�~�-���Qi�t��H�W�
~)��
�5
�W�*�5
�5*�F���'�n)� w|�^v���v)8�m�y��K��D� �tx�|ݮU.`J�#蔏�v!�J@Н.`Jq��o�~2���o��>��o�r�s�Bp6	R⣂��Șs�Bpv��s�+8�H�mN>����d�'x�Q�'����3$�6��!���$�E~6eؤ�8�y�H�D駤�^�3�k�y���]��̍�*2�%W�]��2��+2�eW�]K�2ע�����Ë�7�o�W�o��D���M~  [remap]

importer="texture"
type="StreamTexture"
path="res://.import/goose_idle (1).png-35dc5c94a40ebbe68d5ddee5bcf792e7.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://goose_idle (1).png"
dest_files=[ "res://.import/goose_idle (1).png-35dc5c94a40ebbe68d5ddee5bcf792e7.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              [remap]

path="res://Ball.gdc"
 [remap]

path="res://Node2D.gdc"
               �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name         basket goose   application/run/main_scene         res://Node2D.tscn      application/config/icon         res://icon.png  +   gui/common/drop_mouse_on_gui_input_disabled            input/click�              events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script            deadzone      ?)   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres      