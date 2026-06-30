import 'package:flutter/material.dart';
import '../controllers/algebracontroller.dart';

class QuickMathScreen extends StatefulWidget {
  const QuickMathScreen({super.key});
  @override State<QuickMathScreen> createState() => _QuickMathScreenState();
}
class _QuickMathScreenState extends State<QuickMathScreen> {
  late final AlgebraController _ctrl;
  bool _deg = true;
  @override void initState() { super.initState(); _ctrl = AlgebraController(); }
  @override void dispose()   { _ctrl.dispose(); super.dispose(); }

  static const _kBg=Color(0xFF0A0A1A);static const _kSci=Color(0xFF283593);static const _kSciTx=Color(0xFF5C6BC0);
  static const _kNum=Color(0xFF1E1E3A);static const _kOp=Color(0xFF3949AB);static const _kOpTx=Color(0xFF5C6BC0);
  static const _kFn=Color(0xFF1E1E3A);static const _kEq=Color(0xFF1A237E);static const _kAc=Color(0xFFB71C1C);
  Widget _key(String lbl, VoidCallback fn, {Color bg=_kNum,Color fg=Colors.white,int flex=1,double fs=14.0}) {
    return Expanded(flex:flex,child:Padding(padding:const EdgeInsets.all(1.6),child:Material(color:bg,borderRadius:BorderRadius.circular(4),child:InkWell(borderRadius:BorderRadius.circular(4),splashColor:Colors.white12,onTap:fn,child:Container(alignment:Alignment.center,child:Text(lbl,style:TextStyle(color:fg,fontSize:fs,fontWeight:FontWeight.w500,letterSpacing:-0.2)))))));
  }
  Widget _row(List<Widget> k)=>Expanded(child:Row(crossAxisAlignment:CrossAxisAlignment.stretch,children:k));
  Widget _chip(String t)=>Container(padding:const EdgeInsets.symmetric(horizontal:5,vertical:1),decoration:BoxDecoration(color:const Color(0xFF6A8C45).withValues(alpha:0.35),borderRadius:BorderRadius.circular(3)),child:Text(t,style:const TextStyle(color:Color(0xFF4A6228),fontSize:10,fontWeight:FontWeight.bold)));
  Widget _scaffold(String d,String e,bool deg,VoidCallback tg){
    return Scaffold(backgroundColor:_kBg,body:SafeArea(child:Column(children:[
      Container(width:double.infinity,color:const Color(0xFFCDD8A8),padding:const EdgeInsets.fromLTRB(14,10,14,12),child:Column(crossAxisAlignment:CrossAxisAlignment.end,children:[
        Row(children:[_chip(deg?'DEG':'RAD'),const Spacer(),GestureDetector(onTap:tg,child:Container(padding:const EdgeInsets.symmetric(horizontal:10,vertical:3),decoration:BoxDecoration(color:const Color(0xFF8CA870),borderRadius:BorderRadius.circular(4)),child:Text(deg?'→ RAD':'→ DEG',style:const TextStyle(color:Colors.white,fontSize:11,fontWeight:FontWeight.bold))))]),
        const SizedBox(height:6),
        Text(e.isEmpty?' ':e,style:const TextStyle(color:Color(0xFF4A6228),fontSize:13),textAlign:TextAlign.right,maxLines:1,overflow:TextOverflow.ellipsis),
        const SizedBox(height:2),
        Text(d,style:TextStyle(color:const Color(0xFF1A2A08),fontSize:40.0,fontWeight:FontWeight.w400,letterSpacing:-1.5),textAlign:TextAlign.right,maxLines:1,overflow:TextOverflow.ellipsis),
      ])),
      Expanded(child:Padding(padding:const EdgeInsets.all(3),child:Column(children:[
        _row([_key('sin', () => _ctrl.sci('sin'), bg:_kSci, fg:_kSciTx), _key('cos', () => _ctrl.sci('cos'), bg:_kSci, fg:_kSciTx), _key('tan', () => _ctrl.sci('tan'), bg:_kSci, fg:_kSciTx), _key('log', () => _ctrl.sci('log'), bg:_kSci, fg:_kSciTx), _key('ln', () => _ctrl.sci('ln'), bg:_kSci, fg:_kSciTx)]),
        _row([_key('asin', () => _ctrl.sci('asin'), bg:_kSci, fg:_kSciTx, fs:12.0), _key('acos', () => _ctrl.sci('acos'), bg:_kSci, fg:_kSciTx, fs:12.0), _key('atan', () => _ctrl.sci('atan'), bg:_kSci, fg:_kSciTx, fs:12.0), _key('√x', () => _ctrl.sci('sqrt'), bg:_kSci, fg:_kSciTx), _key('x²', () => _ctrl.sci('x²'), bg:_kSci, fg:_kSciTx)]),
        _row([_key('sinh', () => _ctrl.sci('sinh'), bg:_kSci, fg:_kSciTx, fs:12.0), _key('cosh', () => _ctrl.sci('cosh'), bg:_kSci, fg:_kSciTx, fs:12.0), _key('tanh', () => _ctrl.sci('tanh'), bg:_kSci, fg:_kSciTx, fs:12.0), _key('x³', () => _ctrl.sci('x³'), bg:_kSci, fg:_kSciTx), _key('1/x', () => _ctrl.sci('1/x'), bg:_kSci, fg:_kSciTx)]),
        _row([_key('n!', () => _ctrl.sci('n!'), bg:_kSci, fg:_kSciTx), _key('nPr', () => _ctrl.combo('nPr'), bg:_kSci, fg:_kSciTx, fs:12.0), _key('nCr', () => _ctrl.combo('nCr'), bg:_kSci, fg:_kSciTx, fs:12.0), _key('π', () => _ctrl.sci('π'), bg:_kSci, fg:const Color(0xFFFFD54F)), _key('e', () => _ctrl.sci('e'), bg:_kSci, fg:const Color(0xFFFFD54F))]),
        _row([_key('AC',() => _ctrl.clear(),bg:_kAc,fg:Colors.white),_key('⌫',() => _ctrl.back(),bg:const Color(0xFF3A1818),fg:const Color(0xFFFF8A80)),_key('%',() => _ctrl.pct(),bg:_kFn,fg:Colors.white70),_key('|x|',() => _ctrl.sci('|x|'),bg:_kFn,fg:Colors.white60),_key('+/−',() => _ctrl.sign(),bg:_kFn,fg:Colors.white70)]),
        _row([_key('7',() => _ctrl.digit('7'),fs:20),_key('8',() => _ctrl.digit('8'),fs:20),_key('9',() => _ctrl.digit('9'),fs:20),_key('÷',() => _ctrl.oper('÷'),bg:_kOp,fg:_kOpTx,fs:18),_key('×',() => _ctrl.oper('×'),bg:_kOp,fg:_kOpTx,fs:18)]),
        _row([_key('4',() => _ctrl.digit('4'),fs:20),_key('5',() => _ctrl.digit('5'),fs:20),_key('6',() => _ctrl.digit('6'),fs:20),_key('−',() => _ctrl.oper('−'),bg:_kOp,fg:_kOpTx,fs:18),_key('(',(){}  ,bg:_kFn,fg:Colors.white54)]),
        _row([_key('1',() => _ctrl.digit('1'),fs:20),_key('2',() => _ctrl.digit('2'),fs:20),_key('3',() => _ctrl.digit('3'),fs:20),_key('+',() => _ctrl.oper('+'),bg:_kOp,fg:_kOpTx,fs:18),_key(')',(){}  ,bg:_kFn,fg:Colors.white54)]),
        _row([_key('0',() => _ctrl.digit('0'),flex:2,fs:20),_key('.',() => _ctrl.dot(),fs:20),_key('EXP',(){}  ,bg:_kFn,fg:Colors.white54,fs:12),_key('=',() => _ctrl.equals(),bg:_kEq,fg:Colors.white,fs:22)]),
      ]))),
    ])));
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _ctrl.display,
      builder: (_, d, __) => ValueListenableBuilder<String>(
        valueListenable: _ctrl.expression,
        builder: (_, e, __) => _scaffold(d, e, _deg, () => setState(() => _deg = !_deg)),
      ),
    );
  }
}
