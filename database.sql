PGDMP         6                |            college    15.4    15.4 7    L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            O           1262    16545    college    DATABASE     z   CREATE DATABASE college WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE college;
                postgres    false            h           1247    16706    Role    TYPE     a   CREATE TYPE public."Role" AS ENUM (
    'STUDENT',
    'FACULITY_MEMBER',
    'ADMINISTRATOR'
);
    DROP TYPE public."Role";
       public          postgres    false            �            1259    16610    AdministratorProfiles    TABLE     �   CREATE TABLE public."AdministratorProfiles" (
    user_id integer NOT NULL,
    photo character varying(255),
    department_id integer NOT NULL
);
 +   DROP TABLE public."AdministratorProfiles";
       public         heap    postgres    false            �            1259    16639    Courses    TABLE     �   CREATE TABLE public."Courses" (
    id integer NOT NULL,
    title character varying(100),
    description text,
    department_id integer NOT NULL,
    faculity_id integer NOT NULL
);
    DROP TABLE public."Courses";
       public         heap    postgres    false            �            1259    16638    Courses_id_seq    SEQUENCE     �   ALTER TABLE public."Courses" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Courses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16571    Departments    TABLE     �   CREATE TABLE public."Departments" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);
 !   DROP TABLE public."Departments";
       public         heap    postgres    false            �            1259    16570    Departments_id_seq    SEQUENCE     �   ALTER TABLE public."Departments" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Departments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16657    Enrollments    TABLE     �   CREATE TABLE public."Enrollments" (
    id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL
);
 !   DROP TABLE public."Enrollments";
       public         heap    postgres    false            �            1259    16656    Enrollments_id_seq    SEQUENCE     �   ALTER TABLE public."Enrollments" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Enrollments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    16593    FaculityProfiles    TABLE     �   CREATE TABLE public."FaculityProfiles" (
    user_id integer NOT NULL,
    photo character varying(255),
    department_id integer NOT NULL,
    office_hours character varying(255)
);
 &   DROP TABLE public."FaculityProfiles";
       public         heap    postgres    false            �            1259    16578    StudentProfiles    TABLE     �   CREATE TABLE public."StudentProfiles" (
    user_id integer NOT NULL,
    photo character varying(255),
    department_id integer NOT NULL,
    year character varying(50)
);
 %   DROP TABLE public."StudentProfiles";
       public         heap    postgres    false            �            1259    16547    Users    TABLE       CREATE TABLE public."Users" (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phno integer,
    role public."Role" NOT NULL
);
    DROP TABLE public."Users";
       public         heap    postgres    false    872            �            1259    16546    Users_id_seq    SEQUENCE     �   ALTER TABLE public."Users" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16714    student    TABLE     "  CREATE TABLE public.student (
    id integer NOT NULL,
    email character varying(255),
    name character varying(255),
    password character varying(255),
    role smallint,
    username character varying(255),
    CONSTRAINT student_role_check CHECK (((role >= 0) AND (role <= 2)))
);
    DROP TABLE public.student;
       public         heap    postgres    false            �            1259    16713    student_id_seq    SEQUENCE     �   ALTER TABLE public.student ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    16723    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    name character varying(255),
    password character varying(255),
    phno integer NOT NULL,
    role character varying(255),
    username character varying(255),
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['STUDENT'::character varying, 'FACULITY_MEMBER'::character varying, 'ADMINISTRATOR'::character varying])::text[])))
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16722    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            A          0    16610    AdministratorProfiles 
   TABLE DATA           P   COPY public."AdministratorProfiles" (user_id, photo, department_id) FROM stdin;
    public          postgres    false    220   >D       C          0    16639    Courses 
   TABLE DATA           W   COPY public."Courses" (id, title, description, department_id, faculity_id) FROM stdin;
    public          postgres    false    222   [D       >          0    16571    Departments 
   TABLE DATA           >   COPY public."Departments" (id, name, description) FROM stdin;
    public          postgres    false    217   xD       E          0    16657    Enrollments 
   TABLE DATA           B   COPY public."Enrollments" (id, student_id, course_id) FROM stdin;
    public          postgres    false    224   �D       @          0    16593    FaculityProfiles 
   TABLE DATA           Y   COPY public."FaculityProfiles" (user_id, photo, department_id, office_hours) FROM stdin;
    public          postgres    false    219   �D       ?          0    16578    StudentProfiles 
   TABLE DATA           P   COPY public."StudentProfiles" (user_id, photo, department_id, year) FROM stdin;
    public          postgres    false    218   �D       <          0    16547    Users 
   TABLE DATA           R   COPY public."Users" (id, username, password, name, email, phno, role) FROM stdin;
    public          postgres    false    215   �D       G          0    16714    student 
   TABLE DATA           L   COPY public.student (id, email, name, password, role, username) FROM stdin;
    public          postgres    false    226   =E       I          0    16723    users 
   TABLE DATA           P   COPY public.users (id, email, name, password, phno, role, username) FROM stdin;
    public          postgres    false    228   ZE       P           0    0    Courses_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Courses_id_seq"', 1, false);
          public          postgres    false    221            Q           0    0    Departments_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Departments_id_seq"', 1, false);
          public          postgres    false    216            R           0    0    Enrollments_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Enrollments_id_seq"', 1, false);
          public          postgres    false    223            S           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 2, true);
          public          postgres    false    214            T           0    0    student_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.student_id_seq', 1, false);
          public          postgres    false    225            U           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 48, true);
          public          postgres    false    227            �           2606    16614 0   AdministratorProfiles AdministratorProfiles_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."AdministratorProfiles"
    ADD CONSTRAINT "AdministratorProfiles_pkey" PRIMARY KEY (user_id);
 ^   ALTER TABLE ONLY public."AdministratorProfiles" DROP CONSTRAINT "AdministratorProfiles_pkey";
       public            postgres    false    220            �           2606    16645    Courses Courses_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Courses"
    ADD CONSTRAINT "Courses_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Courses" DROP CONSTRAINT "Courses_pkey";
       public            postgres    false    222            �           2606    16577    Departments Departments_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Departments" DROP CONSTRAINT "Departments_pkey";
       public            postgres    false    217            �           2606    16661    Enrollments Enrollments_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Enrollments"
    ADD CONSTRAINT "Enrollments_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Enrollments" DROP CONSTRAINT "Enrollments_pkey";
       public            postgres    false    224            �           2606    16599 &   FaculityProfiles FaculityProfiles_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public."FaculityProfiles"
    ADD CONSTRAINT "FaculityProfiles_pkey" PRIMARY KEY (user_id);
 T   ALTER TABLE ONLY public."FaculityProfiles" DROP CONSTRAINT "FaculityProfiles_pkey";
       public            postgres    false    219            �           2606    16582 $   StudentProfiles StudentProfiles_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."StudentProfiles"
    ADD CONSTRAINT "StudentProfiles_pkey" PRIMARY KEY (user_id);
 R   ALTER TABLE ONLY public."StudentProfiles" DROP CONSTRAINT "StudentProfiles_pkey";
       public            postgres    false    218            �           2606    16553    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    215            �           2606    16703    Users Users_username_email_key 
   CONSTRAINT     h   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_username_email_key" UNIQUE (username, email);
 L   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_email_key";
       public            postgres    false    215    215            �           2606    16721    student student_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public            postgres    false    226            �           2606    16730    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    228            �           2606    16620 (   AdministratorProfiles admprof_dept_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."AdministratorProfiles"
    ADD CONSTRAINT admprof_dept_id_fk FOREIGN KEY (department_id) REFERENCES public."Departments"(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."AdministratorProfiles" DROP CONSTRAINT admprof_dept_id_fk;
       public          postgres    false    217    220    3220            �           2606    16615 (   AdministratorProfiles admprof_user_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."AdministratorProfiles"
    ADD CONSTRAINT admprof_user_id_fk FOREIGN KEY (user_id) REFERENCES public."Users"(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."AdministratorProfiles" DROP CONSTRAINT admprof_user_id_fk;
       public          postgres    false    215    220    3216            �           2606    16646    Courses course_dep_tid_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Courses"
    ADD CONSTRAINT course_dep_tid_fk FOREIGN KEY (department_id) REFERENCES public."Departments"(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public."Courses" DROP CONSTRAINT course_dep_tid_fk;
       public          postgres    false    222    3220    217            �           2606    16651    Courses course_fac_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Courses"
    ADD CONSTRAINT course_fac_id_fk FOREIGN KEY (faculity_id) REFERENCES public."FaculityProfiles"(user_id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public."Courses" DROP CONSTRAINT course_fac_id_fk;
       public          postgres    false    3224    219    222            �           2606    16667    Enrollments enr_course_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enrollments"
    ADD CONSTRAINT enr_course_id_fk FOREIGN KEY (course_id) REFERENCES public."Courses"(id);
 H   ALTER TABLE ONLY public."Enrollments" DROP CONSTRAINT enr_course_id_fk;
       public          postgres    false    224    222    3228            �           2606    16662    Enrollments enr_stud_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enrollments"
    ADD CONSTRAINT enr_stud_id_fk FOREIGN KEY (student_id) REFERENCES public."StudentProfiles"(user_id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public."Enrollments" DROP CONSTRAINT enr_stud_id_fk;
       public          postgres    false    218    3222    224            �           2606    16605 #   FaculityProfiles facprof_dept_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."FaculityProfiles"
    ADD CONSTRAINT facprof_dept_id_fk FOREIGN KEY (department_id) REFERENCES public."Departments"(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."FaculityProfiles" DROP CONSTRAINT facprof_dept_id_fk;
       public          postgres    false    3220    217    219            �           2606    16600 #   FaculityProfiles facprof_user_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."FaculityProfiles"
    ADD CONSTRAINT facprof_user_id_fk FOREIGN KEY (user_id) REFERENCES public."Users"(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."FaculityProfiles" DROP CONSTRAINT facprof_user_id_fk;
       public          postgres    false    219    3216    215            �           2606    16588 "   StudentProfiles stdprof_dept_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."StudentProfiles"
    ADD CONSTRAINT stdprof_dept_id_fk FOREIGN KEY (department_id) REFERENCES public."Departments"(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."StudentProfiles" DROP CONSTRAINT stdprof_dept_id_fk;
       public          postgres    false    218    3220    217            �           2606    16583 "   StudentProfiles stdprof_user_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."StudentProfiles"
    ADD CONSTRAINT stdprof_user_id_fk FOREIGN KEY (user_id) REFERENCES public."Users"(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public."StudentProfiles" DROP CONSTRAINT stdprof_user_id_fk;
       public          postgres    false    215    218    3216            A      x������ � �      C      x������ � �      >      x������ � �      E      x������ � �      @      x������ � �      ?      x������ � �      <   A   x�3�LL��̋��4426�s��Cznbf�^r~.P�������Đ������38$�1�?�+F��� �S�      G      x������ � �      I   �   x��ֽ
�0��9�
��x~ڤ���.��%:h�V(x��.�~�x��@"�\���6��Y]_C���TA�<$���ñ;���n���Gez��[󸬬BnS��3�D�*Vj�Ҁ�DU2Xi������A'@P��p
e �E(�@Q�9Pԁru��E(��P�90�A���8�:0΁��s��8��ɟ��9�:p΁��U��د�     