# RafaelJS
Vanilla javascript helper to easily bind window resize and scroll events via requestAnimationFrame.

Work in progress!

## Usage

### Basic Example

```
var rafael = new Rafael();

rafael.bind('scroll', function() {
  console.log('Scrolled!');
});
```

### Available events

```
resize, resizeX, resizeY, scroll, scrollX, scrollY, raf
```

Note: `raf` bind directly to `window.requestAnimationFrame`.

### Methods

- `bind`: Bind an event to the rafael instance
- `stop`: Disable's all registered events
- `start`: Re-enables all registered events
- `enabled`: Returns a boolean describing whether the rafael instance is enabled or not
- `dimensions`: Returns an object with the window's current dimensions
- `oldDimensions`: Returns an object with the window's current dimensions before the last requestAnimationFrame call
- `positions`: Returns an object with the document's current scrollpositions
- `oldPositions`: Returns an object with the document's current scrollpositions before the last requestAnimationFrame call

## Build

Compile:
```
$ coffee -cb rafael.coffee
```

Watch:
```
$ coffee -wb rafael.coffee
```
