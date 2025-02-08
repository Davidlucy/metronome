/****************************************************************************
** Meta object code from reading C++ file 'beat.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.6.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../beat.h"
#include <QtCore/qmetatype.h>

#if __has_include(<QtCore/qtmochelpers.h>)
#include <QtCore/qtmochelpers.h>
#else
QT_BEGIN_MOC_NAMESPACE
#endif


#include <memory>

#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'beat.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.6.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {

#ifdef QT_MOC_HAS_STRINGDATA
struct qt_meta_stringdata_CLASSBeatENDCLASS_t {};
constexpr auto qt_meta_stringdata_CLASSBeatENDCLASS = QtMocHelpers::stringData(
    "Beat",
    "strongBeatChanged",
    "",
    "mediumBeatChanged",
    "weakBeatChanged",
    "setStrongBeat",
    "strong",
    "setMediumBeat",
    "medium",
    "setWeakBeat",
    "weak",
    "strongBeat",
    "mediumBeat",
    "weakBeat"
);
#else  // !QT_MOC_HAS_STRING_DATA
struct qt_meta_stringdata_CLASSBeatENDCLASS_t {
    uint offsetsAndSizes[28];
    char stringdata0[5];
    char stringdata1[18];
    char stringdata2[1];
    char stringdata3[18];
    char stringdata4[16];
    char stringdata5[14];
    char stringdata6[7];
    char stringdata7[14];
    char stringdata8[7];
    char stringdata9[12];
    char stringdata10[5];
    char stringdata11[11];
    char stringdata12[11];
    char stringdata13[9];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_CLASSBeatENDCLASS_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_CLASSBeatENDCLASS_t qt_meta_stringdata_CLASSBeatENDCLASS = {
    {
        QT_MOC_LITERAL(0, 4),  // "Beat"
        QT_MOC_LITERAL(5, 17),  // "strongBeatChanged"
        QT_MOC_LITERAL(23, 0),  // ""
        QT_MOC_LITERAL(24, 17),  // "mediumBeatChanged"
        QT_MOC_LITERAL(42, 15),  // "weakBeatChanged"
        QT_MOC_LITERAL(58, 13),  // "setStrongBeat"
        QT_MOC_LITERAL(72, 6),  // "strong"
        QT_MOC_LITERAL(79, 13),  // "setMediumBeat"
        QT_MOC_LITERAL(93, 6),  // "medium"
        QT_MOC_LITERAL(100, 11),  // "setWeakBeat"
        QT_MOC_LITERAL(112, 4),  // "weak"
        QT_MOC_LITERAL(117, 10),  // "strongBeat"
        QT_MOC_LITERAL(128, 10),  // "mediumBeat"
        QT_MOC_LITERAL(139, 8)   // "weakBeat"
    },
    "Beat",
    "strongBeatChanged",
    "",
    "mediumBeatChanged",
    "weakBeatChanged",
    "setStrongBeat",
    "strong",
    "setMediumBeat",
    "medium",
    "setWeakBeat",
    "weak",
    "strongBeat",
    "mediumBeat",
    "weakBeat"
};
#undef QT_MOC_LITERAL
#endif // !QT_MOC_HAS_STRING_DATA
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_CLASSBeatENDCLASS[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       3,   62, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   50,    2, 0x06,    4 /* Public */,
       3,    0,   51,    2, 0x06,    5 /* Public */,
       4,    0,   52,    2, 0x06,    6 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       5,    1,   53,    2, 0x0a,    7 /* Public */,
       7,    1,   56,    2, 0x0a,    9 /* Public */,
       9,    1,   59,    2, 0x0a,   11 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::Bool,    6,
    QMetaType::Void, QMetaType::Bool,    8,
    QMetaType::Void, QMetaType::Bool,   10,

 // properties: name, type, flags
      11, QMetaType::Bool, 0x00015103, uint(0), 0,
      12, QMetaType::Bool, 0x00015103, uint(1), 0,
      13, QMetaType::Bool, 0x00015103, uint(2), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject Beat::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CLASSBeatENDCLASS.offsetsAndSizes,
    qt_meta_data_CLASSBeatENDCLASS,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_CLASSBeatENDCLASS_t,
        // property 'strongBeat'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'mediumBeat'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // property 'weakBeat'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<Beat, std::true_type>,
        // method 'strongBeatChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'mediumBeatChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'weakBeatChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'setStrongBeat'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'setMediumBeat'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'setWeakBeat'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>
    >,
    nullptr
} };

void Beat::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Beat *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->strongBeatChanged(); break;
        case 1: _t->mediumBeatChanged(); break;
        case 2: _t->weakBeatChanged(); break;
        case 3: _t->setStrongBeat((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        case 4: _t->setMediumBeat((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        case 5: _t->setWeakBeat((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Beat::*)();
            if (_t _q_method = &Beat::strongBeatChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Beat::*)();
            if (_t _q_method = &Beat::mediumBeatChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Beat::*)();
            if (_t _q_method = &Beat::weakBeatChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
    } else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Beat *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = _t->isStrongBeat(); break;
        case 1: *reinterpret_cast< bool*>(_v) = _t->isMediumBeat(); break;
        case 2: *reinterpret_cast< bool*>(_v) = _t->isWeakBeat(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Beat *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setStrongBeat(*reinterpret_cast< bool*>(_v)); break;
        case 1: _t->setMediumBeat(*reinterpret_cast< bool*>(_v)); break;
        case 2: _t->setWeakBeat(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

const QMetaObject *Beat::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Beat::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CLASSBeatENDCLASS.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Beat::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 6;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}

// SIGNAL 0
void Beat::strongBeatChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Beat::mediumBeatChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Beat::weakBeatChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}
QT_WARNING_POP
