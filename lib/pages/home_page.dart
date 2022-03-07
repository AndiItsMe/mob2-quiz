import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => {},
          ),
        ],
      ),
      body: _ScrollableQuoteView(),
    );
  }
}

class _ScrollableQuoteView extends StatelessWidget with GetItMixin {
  _ScrollableQuoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Connects the the QuoteManager event stream
    // AsyncSnapshot<Quote> snapshot =
    //     watchStream((QuoteManager m) => m.stream, Quote.none());

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 100,
        ),
        child: Center(
          child: _buildSnapshot(context),
        ),
      ),
    );
  }

  // Widget _buildSnapshot(BuildContext context, AsyncSnapshot<Quote> snapshot) {
  Widget _buildSnapshot(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // QuoteView(quote),
        Padding(
            padding: const EdgeInsets.only(top: 16),
            child: IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.pink,
              onPressed: () => {},
            )),
      ],
    );
  }
}
