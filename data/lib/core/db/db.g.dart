// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String fullName;
  final String? phoneNumber;
  const UserData({required this.id, required this.fullName, this.phoneNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      fullName: Value(fullName),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
    };
  }

  UserData copyWith(
          {int? id,
          String? fullName,
          Value<String?> phoneNumber = const Value.absent()}) =>
      UserData(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fullName, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.phoneNumber == this.phoneNumber);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String?> phoneNumber;
  const UserCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
  });
  UserCompanion.insert({
    required int id,
    required String fullName,
    this.phoneNumber = const Value.absent(),
  })  : id = Value(id),
        fullName = Value(fullName);
  static Insertable<UserData> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? phoneNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id, Value<String>? fullName, Value<String?>? phoneNumber}) {
    return UserCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, fullName, phoneNumber];
  @override
  String get aliasedName => _alias ?? 'user';
  @override
  String get actualTableName => 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      phoneNumber: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class AuthorizationData extends DataClass
    implements Insertable<AuthorizationData> {
  final String refreshToken;
  final String accessToken;
  const AuthorizationData(
      {required this.refreshToken, required this.accessToken});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['refresh_token'] = Variable<String>(refreshToken);
    map['access_token'] = Variable<String>(accessToken);
    return map;
  }

  AuthorizationCompanion toCompanion(bool nullToAbsent) {
    return AuthorizationCompanion(
      refreshToken: Value(refreshToken),
      accessToken: Value(accessToken),
    );
  }

  factory AuthorizationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthorizationData(
      refreshToken: serializer.fromJson<String>(json['refreshToken']),
      accessToken: serializer.fromJson<String>(json['accessToken']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'refreshToken': serializer.toJson<String>(refreshToken),
      'accessToken': serializer.toJson<String>(accessToken),
    };
  }

  AuthorizationData copyWith({String? refreshToken, String? accessToken}) =>
      AuthorizationData(
        refreshToken: refreshToken ?? this.refreshToken,
        accessToken: accessToken ?? this.accessToken,
      );
  @override
  String toString() {
    return (StringBuffer('AuthorizationData(')
          ..write('refreshToken: $refreshToken, ')
          ..write('accessToken: $accessToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(refreshToken, accessToken);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthorizationData &&
          other.refreshToken == this.refreshToken &&
          other.accessToken == this.accessToken);
}

class AuthorizationCompanion extends UpdateCompanion<AuthorizationData> {
  final Value<String> refreshToken;
  final Value<String> accessToken;
  const AuthorizationCompanion({
    this.refreshToken = const Value.absent(),
    this.accessToken = const Value.absent(),
  });
  AuthorizationCompanion.insert({
    required String refreshToken,
    required String accessToken,
  })  : refreshToken = Value(refreshToken),
        accessToken = Value(accessToken);
  static Insertable<AuthorizationData> custom({
    Expression<String>? refreshToken,
    Expression<String>? accessToken,
  }) {
    return RawValuesInsertable({
      if (refreshToken != null) 'refresh_token': refreshToken,
      if (accessToken != null) 'access_token': accessToken,
    });
  }

  AuthorizationCompanion copyWith(
      {Value<String>? refreshToken, Value<String>? accessToken}) {
    return AuthorizationCompanion(
      refreshToken: refreshToken ?? this.refreshToken,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (refreshToken.present) {
      map['refresh_token'] = Variable<String>(refreshToken.value);
    }
    if (accessToken.present) {
      map['access_token'] = Variable<String>(accessToken.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorizationCompanion(')
          ..write('refreshToken: $refreshToken, ')
          ..write('accessToken: $accessToken')
          ..write(')'))
        .toString();
  }
}

class $AuthorizationTable extends Authorization
    with TableInfo<$AuthorizationTable, AuthorizationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorizationTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _refreshTokenMeta =
      const VerificationMeta('refreshToken');
  @override
  late final GeneratedColumn<String> refreshToken = GeneratedColumn<String>(
      'refresh_token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _accessTokenMeta =
      const VerificationMeta('accessToken');
  @override
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
      'access_token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [refreshToken, accessToken];
  @override
  String get aliasedName => _alias ?? 'authorization';
  @override
  String get actualTableName => 'authorization';
  @override
  VerificationContext validateIntegrity(Insertable<AuthorizationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('refresh_token')) {
      context.handle(
          _refreshTokenMeta,
          refreshToken.isAcceptableOrUnknown(
              data['refresh_token']!, _refreshTokenMeta));
    } else if (isInserting) {
      context.missing(_refreshTokenMeta);
    }
    if (data.containsKey('access_token')) {
      context.handle(
          _accessTokenMeta,
          accessToken.isAcceptableOrUnknown(
              data['access_token']!, _accessTokenMeta));
    } else if (isInserting) {
      context.missing(_accessTokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  AuthorizationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthorizationData(
      refreshToken: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}refresh_token'])!,
      accessToken: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}access_token'])!,
    );
  }

  @override
  $AuthorizationTable createAlias(String alias) {
    return $AuthorizationTable(attachedDatabase, alias);
  }
}

class GoalData extends DataClass implements Insertable<GoalData> {
  final int id;
  final String image;
  final String title;
  final String description;
  final int duration;
  final int burnCalories;
  const GoalData(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.duration,
      required this.burnCalories});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['image'] = Variable<String>(image);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['duration'] = Variable<int>(duration);
    map['burn_calories'] = Variable<int>(burnCalories);
    return map;
  }

  GoalCompanion toCompanion(bool nullToAbsent) {
    return GoalCompanion(
      id: Value(id),
      image: Value(image),
      title: Value(title),
      description: Value(description),
      duration: Value(duration),
      burnCalories: Value(burnCalories),
    );
  }

  factory GoalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalData(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String>(json['image']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      duration: serializer.fromJson<int>(json['duration']),
      burnCalories: serializer.fromJson<int>(json['burnCalories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String>(image),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'duration': serializer.toJson<int>(duration),
      'burnCalories': serializer.toJson<int>(burnCalories),
    };
  }

  GoalData copyWith(
          {int? id,
          String? image,
          String? title,
          String? description,
          int? duration,
          int? burnCalories}) =>
      GoalData(
        id: id ?? this.id,
        image: image ?? this.image,
        title: title ?? this.title,
        description: description ?? this.description,
        duration: duration ?? this.duration,
        burnCalories: burnCalories ?? this.burnCalories,
      );
  @override
  String toString() {
    return (StringBuffer('GoalData(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('duration: $duration, ')
          ..write('burnCalories: $burnCalories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, image, title, description, duration, burnCalories);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalData &&
          other.id == this.id &&
          other.image == this.image &&
          other.title == this.title &&
          other.description == this.description &&
          other.duration == this.duration &&
          other.burnCalories == this.burnCalories);
}

class GoalCompanion extends UpdateCompanion<GoalData> {
  final Value<int> id;
  final Value<String> image;
  final Value<String> title;
  final Value<String> description;
  final Value<int> duration;
  final Value<int> burnCalories;
  const GoalCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.duration = const Value.absent(),
    this.burnCalories = const Value.absent(),
  });
  GoalCompanion.insert({
    required int id,
    required String image,
    required String title,
    required String description,
    required int duration,
    required int burnCalories,
  })  : id = Value(id),
        image = Value(image),
        title = Value(title),
        description = Value(description),
        duration = Value(duration),
        burnCalories = Value(burnCalories);
  static Insertable<GoalData> custom({
    Expression<int>? id,
    Expression<String>? image,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? duration,
    Expression<int>? burnCalories,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (duration != null) 'duration': duration,
      if (burnCalories != null) 'burn_calories': burnCalories,
    });
  }

  GoalCompanion copyWith(
      {Value<int>? id,
      Value<String>? image,
      Value<String>? title,
      Value<String>? description,
      Value<int>? duration,
      Value<int>? burnCalories}) {
    return GoalCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      burnCalories: burnCalories ?? this.burnCalories,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (burnCalories.present) {
      map['burn_calories'] = Variable<int>(burnCalories.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('duration: $duration, ')
          ..write('burnCalories: $burnCalories')
          ..write(')'))
        .toString();
  }
}

class $GoalTable extends Goal with TableInfo<$GoalTable, GoalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _burnCaloriesMeta =
      const VerificationMeta('burnCalories');
  @override
  late final GeneratedColumn<int> burnCalories = GeneratedColumn<int>(
      'burn_calories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, image, title, description, duration, burnCalories];
  @override
  String get aliasedName => _alias ?? 'goal';
  @override
  String get actualTableName => 'goal';
  @override
  VerificationContext validateIntegrity(Insertable<GoalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('burn_calories')) {
      context.handle(
          _burnCaloriesMeta,
          burnCalories.isAcceptableOrUnknown(
              data['burn_calories']!, _burnCaloriesMeta));
    } else if (isInserting) {
      context.missing(_burnCaloriesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  GoalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      image: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      duration: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      burnCalories: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}burn_calories'])!,
    );
  }

  @override
  $GoalTable createAlias(String alias) {
    return $GoalTable(attachedDatabase, alias);
  }
}

class ExerciseData extends DataClass implements Insertable<ExerciseData> {
  final int id;
  final String image;
  final String title;
  final int duration;
  final int burnCalories;
  final int plan;
  const ExerciseData(
      {required this.id,
      required this.image,
      required this.title,
      required this.duration,
      required this.burnCalories,
      required this.plan});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['image'] = Variable<String>(image);
    map['title'] = Variable<String>(title);
    map['duration'] = Variable<int>(duration);
    map['burn_calories'] = Variable<int>(burnCalories);
    map['plan'] = Variable<int>(plan);
    return map;
  }

  ExerciseCompanion toCompanion(bool nullToAbsent) {
    return ExerciseCompanion(
      id: Value(id),
      image: Value(image),
      title: Value(title),
      duration: Value(duration),
      burnCalories: Value(burnCalories),
      plan: Value(plan),
    );
  }

  factory ExerciseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseData(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String>(json['image']),
      title: serializer.fromJson<String>(json['title']),
      duration: serializer.fromJson<int>(json['duration']),
      burnCalories: serializer.fromJson<int>(json['burnCalories']),
      plan: serializer.fromJson<int>(json['plan']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String>(image),
      'title': serializer.toJson<String>(title),
      'duration': serializer.toJson<int>(duration),
      'burnCalories': serializer.toJson<int>(burnCalories),
      'plan': serializer.toJson<int>(plan),
    };
  }

  ExerciseData copyWith(
          {int? id,
          String? image,
          String? title,
          int? duration,
          int? burnCalories,
          int? plan}) =>
      ExerciseData(
        id: id ?? this.id,
        image: image ?? this.image,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        burnCalories: burnCalories ?? this.burnCalories,
        plan: plan ?? this.plan,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseData(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('title: $title, ')
          ..write('duration: $duration, ')
          ..write('burnCalories: $burnCalories, ')
          ..write('plan: $plan')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, image, title, duration, burnCalories, plan);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseData &&
          other.id == this.id &&
          other.image == this.image &&
          other.title == this.title &&
          other.duration == this.duration &&
          other.burnCalories == this.burnCalories &&
          other.plan == this.plan);
}

class ExerciseCompanion extends UpdateCompanion<ExerciseData> {
  final Value<int> id;
  final Value<String> image;
  final Value<String> title;
  final Value<int> duration;
  final Value<int> burnCalories;
  final Value<int> plan;
  const ExerciseCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.title = const Value.absent(),
    this.duration = const Value.absent(),
    this.burnCalories = const Value.absent(),
    this.plan = const Value.absent(),
  });
  ExerciseCompanion.insert({
    required int id,
    required String image,
    required String title,
    required int duration,
    required int burnCalories,
    required int plan,
  })  : id = Value(id),
        image = Value(image),
        title = Value(title),
        duration = Value(duration),
        burnCalories = Value(burnCalories),
        plan = Value(plan);
  static Insertable<ExerciseData> custom({
    Expression<int>? id,
    Expression<String>? image,
    Expression<String>? title,
    Expression<int>? duration,
    Expression<int>? burnCalories,
    Expression<int>? plan,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (title != null) 'title': title,
      if (duration != null) 'duration': duration,
      if (burnCalories != null) 'burn_calories': burnCalories,
      if (plan != null) 'plan': plan,
    });
  }

  ExerciseCompanion copyWith(
      {Value<int>? id,
      Value<String>? image,
      Value<String>? title,
      Value<int>? duration,
      Value<int>? burnCalories,
      Value<int>? plan}) {
    return ExerciseCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      burnCalories: burnCalories ?? this.burnCalories,
      plan: plan ?? this.plan,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (burnCalories.present) {
      map['burn_calories'] = Variable<int>(burnCalories.value);
    }
    if (plan.present) {
      map['plan'] = Variable<int>(plan.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('title: $title, ')
          ..write('duration: $duration, ')
          ..write('burnCalories: $burnCalories, ')
          ..write('plan: $plan')
          ..write(')'))
        .toString();
  }
}

class $ExerciseTable extends Exercise
    with TableInfo<$ExerciseTable, ExerciseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _burnCaloriesMeta =
      const VerificationMeta('burnCalories');
  @override
  late final GeneratedColumn<int> burnCalories = GeneratedColumn<int>(
      'burn_calories', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _planMeta = const VerificationMeta('plan');
  @override
  late final GeneratedColumn<int> plan = GeneratedColumn<int>(
      'plan', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, image, title, duration, burnCalories, plan];
  @override
  String get aliasedName => _alias ?? 'exercise';
  @override
  String get actualTableName => 'exercise';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('burn_calories')) {
      context.handle(
          _burnCaloriesMeta,
          burnCalories.isAcceptableOrUnknown(
              data['burn_calories']!, _burnCaloriesMeta));
    } else if (isInserting) {
      context.missing(_burnCaloriesMeta);
    }
    if (data.containsKey('plan')) {
      context.handle(
          _planMeta, plan.isAcceptableOrUnknown(data['plan']!, _planMeta));
    } else if (isInserting) {
      context.missing(_planMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ExerciseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      image: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      duration: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      burnCalories: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}burn_calories'])!,
      plan: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}plan'])!,
    );
  }

  @override
  $ExerciseTable createAlias(String alias) {
    return $ExerciseTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $UserTable user = $UserTable(this);
  late final $AuthorizationTable authorization = $AuthorizationTable(this);
  late final $GoalTable goal = $GoalTable(this);
  late final $ExerciseTable exercise = $ExerciseTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [user, authorization, goal, exercise];
}
